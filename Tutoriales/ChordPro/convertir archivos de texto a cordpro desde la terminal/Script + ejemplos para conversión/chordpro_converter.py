#!/usr/bin/env python3
import curses
import os
import subprocess
import threading
from queue import Queue

class ChordProConverter:
    def __init__(self, stdscr):
        self.stdscr = stdscr
        self.files = []
        self.selected = set()
        self.current_index = 0
        self.status = ""
        self.conversion_queue = Queue()
        self.converting = False

    def load_files(self):
        """Cargar archivos .txt del directorio actual"""
        self.files = [f for f in os.listdir('.')
                     if f.endswith('.txt') and os.path.isfile(f)]
        self.files.sort()

    def draw_menu(self):
        """Dibujar la interfaz de selección"""
        self.stdscr.clear()
        height, width = self.stdscr.getmaxyx()

        # Título
        title = "Selecciona archivos para convertir a ChordPro (ESPACIO para seleccionar, ENTER para convertir)"
        self.stdscr.addstr(0, 0, title[:width-1], curses.A_BOLD)

        # Lista de archivos
        for idx, filename in enumerate(self.files):
            if idx >= height - 4:  # Dejar espacio para el status
                break

            line = f"{'▶' if idx == self.current_index else ' '} "
            line += f"[{'X' if idx in self.selected else ' '}] {filename}"

            # Resaltar selección actual
            attr = curses.A_REVERSE if idx == self.current_index else curses.A_NORMAL
            self.stdscr.addstr(idx + 2, 0, line[:width-1], attr)

        # Status bar
        status_line = f"Seleccionados: {len(self.selected)} | {self.status}"
        self.stdscr.addstr(height-2, 0, status_line[:width-1], curses.A_REVERSE)

        # Instrucciones
        instructions = "Q: Salir  |  a: Seleccionar todos  |  d: Deseleccionar todos"
        self.stdscr.addstr(height-1, 0, instructions[:width-1])

        self.stdscr.refresh()

    def convert_files(self):
        """Convertir archivos seleccionados en segundo plano"""
        self.converting = True
        self.status = "Convirtiendo..."
        self.draw_menu()

        def conversion_worker():
            selected_files = [self.files[i] for i in self.selected]

            for filename in selected_files:
                output_file = os.path.splitext(filename)[0] + '.cho'

                # Ejecutar el comando chordpro
                try:
                    cmd = ['chordpro', filename, '--output', output_file]
                    result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)

                    if result.returncode == 0:
                        self.conversion_queue.put(f"✓ {filename} → {output_file}")
                    else:
                        self.conversion_queue.put(f"✗ {filename}: Error")

                except subprocess.TimeoutExpired:
                    self.conversion_queue.put(f"✗ {filename}: Timeout")
                except Exception as e:
                    self.conversion_queue.put(f"✗ {filename}: {str(e)}")

            self.conversion_queue.put("DONE")

        # Iniciar el hilo de conversión
        thread = threading.Thread(target=conversion_worker)
        thread.daemon = True
        thread.start()

    def run(self):
        """Ejecutar la aplicación principal"""
        self.load_files()

        if not self.files:
            self.status = "No se encontraron archivos .txt en el directorio actual"
            self.draw_menu()
            self.stdscr.getch()
            return

        while True:
            self.draw_menu()
            key = self.stdscr.getch()

            # Procesar mensajes de la cola de conversión
            while not self.conversion_queue.empty():
                msg = self.conversion_queue.get()
                if msg == "DONE":
                    self.converting = False
                    self.status = "Conversión completada!"
                else:
                    self.status = msg

            if self.converting:
                continue

            if key == ord('q') or key == ord('Q'):
                break
            elif key == curses.KEY_UP and self.current_index > 0:
                self.current_index -= 1
            elif key == curses.KEY_DOWN and self.current_index < len(self.files) - 1:
                self.current_index += 1
            elif key == ord(' '):  # Espacio para seleccionar/deseleccionar
                if self.current_index in self.selected:
                    self.selected.remove(self.current_index)
                else:
                    self.selected.add(self.current_index)
            elif key == ord('a') or key == ord('A'):  # Seleccionar todos
                self.selected = set(range(len(self.files)))
            elif key == ord('d') or key == ord('D'):  # Deseleccionar todos
                self.selected.clear()
            elif key == 10 or key == 13:  # Enter para convertir
                if self.selected:
                    self.convert_files()

def main(stdscr):
    # Configuración inicial de curses
    curses.curs_set(0)  # Ocultar cursor
    stdscr.keypad(True)  # Habilitar teclas especiales

    # Inicializar la aplicación
    converter = ChordProConverter(stdscr)
    converter.run()

if __name__ == "__main__":
    try:
        curses.wrapper(main)
    except KeyboardInterrupt:
        print("\nOperación cancelada por el usuario")
    except Exception as e:
        print(f"Error: {e}")
