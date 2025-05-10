
# Cómo instalar y usar vim editor de archivos para terminal

En los Sistemas Operativos Linux puede venir instalado`vi` el cual es una versión ligera de `vim` y es muy dificil de usar. Lo mejor es instalar`vim` el cual es una versón completa y facil de usar (por así decirlo), aquí te explico cómo instalarlo.

## **Ver si ya tienes vim**
Primero verifica si ya está instalado:

```bash
vim --version
```

## **Instalar vi (vim) en Debian**

### 1. **Actualizar el sistema (opcional pero recomendado):**
```bash
sudo apt update && sudo apt upgrade
```

### 2. **Instalar vim:**
```bash
sudo apt install vim
```

Esto instalará la versión completa de Vim (recomendada).

### **Verifica la instalación**
```bash
vim --version
```

Te debería mostrar la versión de `vim` instalada, con opciones y características habilitadas.

# **Tutorial básico de `vim` para Debian (y cualquier Linux)**

## **1. Abrir un archivo**
Para abrir o crear un archivo:
```bash
vim archivo.txt
```
## **2. Modo normal vs modo de inserción**
`vim` tiene varios modos, pero los principales son:

- **Modo normal**: es el modo por defecto al abrir `vim`, donde puedes moverte, borrar, copiar, etc.
- **Modo de inserción**: es donde puedes escribir texto normalmente.

## Cambiar al modo de inserción:
Presiona alguna de estas teclas:

- `i` → insertar antes del cursor
- `I` → insertar al inicio de la línea
- `a` → añadir después del cursor
- `A` → añadir al final de la línea

## Volver al modo normal:
Presiona `Esc`.

## **3. Guardar y salir**
Estando en modo normal (`Esc`):

- `:w` → guardar (write)
- `:q` → salir (quit) (pero, si no has guardado los cambios no podrás salir)
- `:wq` o `ZZ` → guardar y salir
- `:q!` → salir sin guardar

## **4. Moverse dentro del archivo**
En modo normal:

- `h` → izquierda
- `l` → derecha
- `j` → abajo
- `k` → arriba

Otros útiles:

- `0` → inicio de línea
- `$` → final de línea
- `G` → ir al final del archivo
- `gg` → ir al inicio del archivo

## **5. Borrar texto**
En modo normal:

- `x` → borra un carácter
- `dd` → borra una línea completa
- `dw` → borra una palabra
- `d$` → borra hasta el final de la línea

## **6. Copiar y pegar**
En modo normal:

- `yy` → copia una línea (yank)
- `p` → pega después del cursor
- `P` → pega antes del cursor

## **7. Buscar texto**
En modo normal:

- `/palabra` → busca hacia abajo
- `?palabra` → busca hacia arriba
- `n` → siguiente coincidencia
- `N` → anterior coincidencia

## **8. Deshacer y rehacer**
En modo normal:

- `u` → deshacer
- `Ctrl + r` → rehacer

Dios les bendiga


