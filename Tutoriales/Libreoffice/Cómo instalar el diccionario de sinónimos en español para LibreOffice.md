### Cómo instalar el diccionario de sinónimos en español para LibreOffice (Debian/Ubuntu/Mint y derivados)

#### **Instalación básica**
1. Abre una terminal y ejecuta:
   ```bash
   sudo apt install mythes-es
   ```
2. **Reinicia LibreOffice** si estaba abierto.

#### **Cómo usar el tesauro**
- Selecciona una palabra (ej: "casa") y:
  - Ve a `Herramientas > Sinónimos`, o
  - Usa el atajo de teclado `Ctrl + F7`.

---

### **Instalar tesauros para otros idiomas**
#### **Método 1 (terminal)**
Busca disponibles con:
```bash
apt search mythes- | grep "Thesaurus"
```
Ejemplo para instalar el alemán:
```bash
sudo apt install mythes-de
```

#### **Método 2 (Synaptic)**
Si prefieres una interfaz gráfica:
```bash
sudo apt install synaptic
```
Busca `mythes` en Synaptic para ver todos los diccionarios.

---

### **Lista completa de tesauros disponibles** (paquetes `mythes-*`)

- **mythes-ar** → Árabe  
- **mythes-bg** → Búlgaro  
- **mythes-ca** → Catalán  
- **mythes-cs** → Checo  
- **mythes-da** → Danés  
- **mythes-de** → Alemán (estándar)  
- **mythes-de-ch** → Alemán (suizo)  
- **mythes-en-au** → Inglés australiano  
- **mythes-en-us** → Inglés (EE.UU.)  
- **mythes-es** → Español  
- **mythes-fr** → Francés  
- **mythes-gl** → Gallego  
- **mythes-gug** → Guaraní  
- **mythes-hu** → Húngaro  
- **mythes-id** → Indonesio  
- **mythes-is** → Islandés  
- **mythes-it** → Italiano  
- **mythes-lv** → Letón  
- **mythes-ne** → Nepalí  
- **mythes-no** → Noruego  
- **mythes-pl** → Polaco  
- **mythes-pt-pt** → Portugués (Portugal)  
- **mythes-ro** → Rumano  
- **mythes-ru** → Ruso  
- **mythes-sk** → Eslovaco  
- **mythes-sl** → Esloveno  
- **mythes-sv** → Sueco  
- **mythes-uk** → Ucraniano  

---

### **Recomendaciones adicionales**
1. **Paquetes relacionados**: Para una experiencia completa, instala también:
   ```bash
   sudo apt install hunspell-es myspell-es  # Español, por ejemplo
   ```
2. **Verificación**: Tras instalar, verifica en LibreOffice en:
   `Herramientas > Opciones > Idioma > Lingüística`.

3. **Fuentes alternativas**: Si falta algún idioma, descarga manualmente desde:
   - [Extensión de tesauros para LibreOffice](https://extensions.libreoffice.org/)

---

### **Nota final**
En distribuciones basadas en Debian estable (como MX Linux 21), algunos paquetes pueden estar en versión antigua. Si necesitas diccionarios más actualizados, considera:
```bash
sudo apt install -t bookworm-backports mythes-es  # Ejemplo para Debian 12
```

¡Espero que sea útil! Si quieres añadir más detalles o capturas de pantalla, sería un excelente complemento. 😊