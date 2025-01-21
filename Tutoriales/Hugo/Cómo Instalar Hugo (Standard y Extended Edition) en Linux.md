### Tutorial: Cómo Instalar Hugo (Standard y Extended Edition) en Linux

Este tutorial explica cómo instalar **Hugo**, un generador de sitios estáticos, utilizando Go en Linux. También se incluyen los requisitos de cada edición y los pasos para instalar Go.

---

### **Requisitos para Hugo 0141 https://github.com/gohugoio/hugo/releases/tag/v0.141.0**

| **Edición**       | **Requisitos**                                                                           |
|--------------------|------------------------------------------------------------------------------------------|
| **Standard**       | Go 1.20 o superior.                                                                     |
| **Extended**       | Go 1.20 o superior, y un compilador C como GCC (o Clang).                               |

---

### **Tutorial: Cómo instalar Go en Linux**

Sigue estos pasos para instalar Go, una herramienta necesaria para instalar Hugo.

#### **1. Instalar Go desde el repositorio del sistema**
A esta fecha 2025 enero, ejemplo en Debian 12 está Go la versión 1.19 por lo que no nos sirve para la ultima versión de Hugo:

Debian 12 está Go 1.19
https://packages.debian.org/bookworm/golang

pero en Ubuntu 

https://packages.ubuntu.com/search?keywords=golang

Ubuntu 24.04 LTS está Go 1.22
https://packages.ubuntu.com/noble/golang

entonces en Ubuntu 24.04 se lo puede instalar así:

1. Actualiza los repositorios:
   ```bash
   sudo apt update
   ```
2. Instala Go:
   ```bash
   sudo apt install golang-go golang
   ```

#### **2. Verificar la instalación**
1. Verifica la versión instalada de Go:
   ```bash
   go version
   ```
   Esto debería devolver algo como:  
   `go version go1.22 linux/amd64`.

2. Asegúrate de que las variables de entorno estén configuradas correctamente:
   ```bash
   go env
   ```

#### **3. Instalar la última versión de Go (para Debian 12)**
1. Descarga el archivo desde el sitio oficial: [https://go.dev/dl/](https://go.dev/dl/).

2. Instalación:

**Para 64 bit**
Extrae el archivo descargado (por ejemplo, `go1.xx.linux-amd64.tar.gz`) y muévelo a `/usr/local` con:
   ```bash
   sudo tar -C /usr/local -xzf go1*.*.*.linux-amd64.tar.gz
   ```
**Para 32 bit**
Extrae el archivo descargado (por ejemplo, `go1.xx.linux-386.tar.gz`) y muévelo a `/usr/local` con:
   ```bash
   sudo tar -C /usr/local -xzf go1*.*.*.linux-386.tar.gz
   ```
   
3. Agrega la ruta de Go a tu variable de entorno `PATH` editando el archivo `~/.bashrc`:
   ```bash
   echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
   source ~/.bashrc
   ```

4. Verifica la instalación con:
   ```bash
   go version
   ```

---

### **Instalar Hugo**

#### **Paso 1: Entender las ediciones**
- **Standard Edition**:
  - Requiere únicamente Go 1.20 o superior.
  - No incluye soporte para SCSS/Sass.
  - Tamaño aproximado: **~25 MB**.
  - Comando de instalación:
    ```bash
    go install github.com/gohugoio/hugo@latest
    ```

- **Extended Edition**:
  - Requiere Go 1.20 o superior y un compilador C como GCC.
  - Incluye soporte para SCSS/Sass.
  - Tamaño aproximado: **~50 MB**.
  - Comando de instalación:
    ```bash
    CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
    ```

#### **Paso 2: Instalar Hugo**
1. **Standard Edition**:
   Ejecuta el comando:
   ```bash
   go install github.com/gohugoio/hugo@latest
   ```

2. **Extended Edition**:
   Ejecuta el comando:
   ```bash
   CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo@latest
   ```

#### **Paso 3: Configurar el PATH**
Por defecto, Hugo se instala en `$HOME/go/bin`, pero este directorio no está en el PATH del sistema. Para solucionarlo:
1. Añade `$HOME/go/bin` al PATH:
   ```bash
   echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
   source ~/.bashrc
   ```
2. Verifica que el PATH incluya `$HOME/go/bin`:
   ```bash
   echo $PATH
   ```

#### **Paso 4: Verificar la Instalación**
1. Asegúrate de que Hugo está en `$HOME/go/bin`:
   ```bash
   ls $HOME/go/bin/hugo
   ```
2. Ejecuta el siguiente comando:
   ```bash
   hugo version
   ```
   Esto debería devolver algo como:  
   `Hugo Static Site Generator vX.X.X`.

---

### **Diferencias Entre Standard y Extended Edition**

| **Característica**          | **Standard Edition**          | **Extended Edition**          |
|------------------------------|-------------------------------|--------------------------------|
| Soporte para SCSS/Sass       | ❌                            | ✅                             |
| Dependencias adicionales     | No requiere                  | GCC o Clang                   |
| Tamaño aproximado del binario| ~25 MB                       | ~50 MB                        |
| Uso recomendado              | Sitios simples, sin estilos SCSS | Sitios avanzados con SCSS/Sass |

---

### **Solución de Problemas**

1. **Comando "hugo" no encontrado**:
   - Asegúrate de que `$HOME/go/bin` está en el PATH (ver Paso 3).

2. **Error al compilar la Extended Edition**:
   - Instala un compilador C:
     ```bash
     sudo apt install build-essential
     ```

---

### **Notas Finales**
- Usa la **Standard Edition** para proyectos simples.
- Usa la **Extended Edition** si necesitas procesar SCSS/Sass.

¡Dios te bendiga! 🎉
