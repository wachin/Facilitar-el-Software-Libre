# **Tutorial: Cómo instalar Go en Linux**

Este tutorial te guía para instalar Go en una distribución de Linux basada en Debian, como Ubuntu.

---

## **1. Instalación de Go**

Ejecuta el siguiente comando para instalar Go utilizando `apt`:

```bash
sudo apt update
sudo apt install golang-go golang
```

> **Nota:** Este comando instala la versión de Go disponible en los repositorios oficiales de tu sistema. Si necesitas la última versión, revisa la sección de "Instalar la última versión de Go".

---

## **2. Verificar la instalación**

Después de instalar Go, verifica que esté correctamente configurado con los siguientes comandos:

1. **Mostrar la versión de Go instalada**:
   ```bash
   go version
   ```
   Esto debería devolver algo como:  
   `go version go1.xx linux/amd64`

2. **Ver la ayuda de Go**:
   ```bash
   go
   ```

3. **Mostrar la configuración del entorno de Go**:
   ```bash
   go env
   ```

   Este comando proporciona detalles sobre las variables de entorno, como el directorio de instalación (`GOROOT`) y el espacio de trabajo (`GOPATH`).

---

## **3. Crear un programa "Hello, World!"**

Sigue estos pasos para probar tu instalación de Go con un programa básico:

1. **Crea un archivo llamado `helloworld.go`**:
   ```bash
   nano helloworld.go
   ```

2. **Escribe el siguiente código en el archivo**:

   ```go
   package main

   import (
       "fmt"
   )

   func main() {
       fmt.Println("Hello, World!")
   }
   ```

3. **Guarda el archivo y cierra el editor** (en Nano, presiona `CTRL+O`, `Enter` y luego `CTRL+X`).

4. **Ejecuta el programa**:
   ```bash
   go run helloworld.go
   ```

   Si todo está correctamente configurado, deberías ver en la terminal:  
   `Hello, World!`

---

## **4. Instalar la última versión de Go (opcional)**

Si necesitas la última versión de Go (en lugar de la que ofrece tu repositorio), sigue estos pasos:

1. Descarga el paquete oficial desde el sitio web de Go:  
   [https://go.dev/dl/](https://go.dev/dl/)

2. Instalación

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

## **5. Recursos adicionales**

- [Documentación oficial de Go](https://go.dev/doc/)
- Tutorial en [TecAdmin](https://tecadmin.net/install-go-on-ubuntu/)
- Guía en [Vultr](https://www.vultr.com/docs/install-the-latest-version-of-golang-on-ubuntu)

---

Dios te bendiga
