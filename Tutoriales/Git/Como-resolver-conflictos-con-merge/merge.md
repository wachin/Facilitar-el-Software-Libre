# Cómo resolver conflictos en un repositorio git con merge el cuál está siendo trabajado desde dos ordenadores diferentes

Tengo un repositorio de mi proyecto RisenPC Fluxbox y con frecuencia lo edito desde dos ordenadores diferentes, y estas son unas investigaciones para saber como usar git para mantener sincronizados los repositorios resolviendo los conflictos entre ellos, para saber cómo verificar las diferencias entre la rama local y la rama remota. Aquí pasos detallados:

## 1. Clonar el repositorio
Clonar el repositorio a tu máquina local:

```bash
git clone https://github.com/wachin/RisenPC-Fluxbox-ES
cd RisenPC-Fluxbox-ES
```

## 2. Hacer `fetch`
Obtén los cambios más recientes del repositorio remoto sin aplicarlos todavía:
```bash
git fetch origin
```

Si solo tienes una rama pon:

```bash
git fetch
```

## 3. Verificar las diferencias (opcional)
Para ver las diferencias entre tu rama local y la rama remota, puedes usar `git diff`. Asumiendo que estás en la rama `main`:

```bash
git diff main origin/main
```

Este comando te mostrará las diferencias entre tu rama `main` local y la rama `main` en el repositorio remoto. Verás qué líneas se han añadido, modificado o eliminado en comparación con tu copia local.

## 4. Revisar el estado de tu rama local
Puedes verificar el estado de tu rama local con:
```bash
git status
```

Esto te dará una idea de si hay cambios pendientes en tu rama local que no se han comprometido.

## 5. Fusionar los cambios
Si estás listo para fusionar los cambios del repositorio remoto en tu rama local, puedes hacer:

```bash
git merge origin/main
```
Si solo tienes una rama pon:

```bash
git merge
```

---

## Resolver Conflictos (si los hay)
Si hay conflictos durante el merge, Git te avisará y tendrás que resolverlos manualmente. Abre los archivos con conflictos, realiza los cambios necesarios y luego marca los archivos como resueltos:

```bash
# Editar archivos con conflictos y resolver los cambios
git add [archivo-con-conflicto]

# Finalizar el merge
git commit
```

Siguiendo estos pasos, deberías poder verificar y fusionar los cambios del repositorio remoto en tu rama local sin problemas.


# Si alguna vez se daña un repositorio
Si alguna vez se daña un repositorio y te sale algún mensaje como este:

```bash
wachin@mx23KDE:~/Dev/mirepo
$ git status
fatal: objeto suelto 692e0a3c4b6e4a93f23e0df85333416686ffc6ce (guardado en .git/objects/69/2e0a3c4b6e4a93f23e0df85333416686ffc6ce) está corrompido
```

lo que hago yo es dejarlo allí como está, y descargar el repositorio otra vez pero en otra carpeta:

```bash
git clone https://github.com/wachin/mirepo
```
y luego abrir meld (hay que tenerlo instalado) y comparar las dos carpetas del repositorio y copiar los cambios que no pudes enviar (git push) del repositorio dañado al repositorio bueno, y en el repositorio bueno has git add . git commit git push para sincronizarlos, y cuando esté listo, borrar el repositorio dañado.

# Cómo evitar problemas futuros en los repositorios

Para evitar algún problema con los repositorios en el futuro, puedes seguir estas buenas prácticas en Git y en tu sistema:  

---

## **1. Verifica el estado de tu disco duro** 🛠️  
Si los archivos se corrompen frecuentemente, podría haber un problema con el disco

- **Verificación con Gnome Disk Utility**
Apaga tu ordenador Linux, Crean un Pendrive Live Linux (ejemplo con MX Linux) e insertarlo en tu ordenador y corre Linux allí, y dentro Instala Gnome Disk Utility:

```bash
sudo apt install gnome-disk-utility
``` 
abrelo y dale clic a la partición de tu ordenador y luego clic en la tuerca y busca la opción para chequear la unidad, y si tuviera algún problema dale clic a la opción de reparar.

---

## **2. Asegúrate de cerrar correctamente Git antes de apagar el sistema** 🖥️  
Si apagas la PC mientras Git está ejecutando operaciones (como `commit`, `pull`, `push`, `gc`, etc.), el repositorio puede quedar en un estado inconsistente. Antes de apagar, asegúrate de que no haya procesos de Git activos, revisa la terminal.

---

## **3. Usa `git gc` periódicamente para limpiar el repositorio** 🔄  
Cada cierto tiempo (por ejemplo, una vez al mes), ejecuta:  
```sh
git gc --prune=now
git fsck --full
```
Esto eliminará objetos innecesarios y verificará la integridad del repositorio.

Aquí te explico qué hacen estos dos comandos y por qué son útiles:  

### **1. `git gc --prune=now`** 🧹  
`git gc` (garbage collection) limpia y optimiza el repositorio eliminando archivos innecesarios.  

- `--prune=now` elimina los objetos huérfanos (objetos sin referencias en el historial) de inmediato, en lugar de esperar el tiempo estándar de expiración de 2 semanas.  
- También reempaqueta objetos dispersos para mejorar la eficiencia del almacenamiento.  

💡 **Cuándo usarlo**:  
- Cuando el repositorio ocupa mucho espacio sin razón.  
- Después de eliminar muchas ramas o hacer `git reset`.  
- Cuando hay objetos sueltos que podrían causar corrupción.  

---

### **2. `git fsck --full`** 🔍  
`git fsck` (file system check) revisa la integridad del repositorio buscando archivos corruptos o inconsistentes.  

- `--full` hace una verificación completa, detectando errores que una verificación normal podría pasar por alto.  

💡 **Cuándo usarlo**:  
- Si Git te da errores de objetos corruptos.  
- Si el repositorio se comporta de manera extraña (archivos que desaparecen, commits que no se reflejan bien, etc.).  
- Para asegurarte de que el repositorio está en buen estado después de un fallo de sistema o interrupción inesperada.  

---

### **Resumen**  
- `git gc --prune=now` → Limpia y optimiza el repositorio.  
- `git fsck --full` → Escanea el repositorio en busca de errores y archivos corruptos.  

Si tienes problemas de corrupción en Git, primero ejecuta `git fsck --full` para diagnosticar, y luego `git gc --prune=now` para limpiar los objetos problemáticos. 🚀

La razón de inicialmente ejecutar **`git gc --prune=now` antes de `git fsck --full`** es porque muchas veces los problemas de corrupción en Git son causados por **objetos sueltos** o referencias antiguas.  

Al ejecutar `git gc --prune=now` primero, **Git limpia automáticamente objetos huérfanos o dañados** y optimiza el almacenamiento. Esto **puede resolver el problema sin necesidad de hacer un diagnóstico manual** con `git fsck --full`.  

### 📌 **Entonces, ¿cuál es el mejor orden?**  
- Si ya **sabes** que hay un problema de corrupción, lo mejor es **diagnosticar primero** con `git fsck --full` y luego limpiar con `git gc --prune=now`.  
- Pero si solo estás haciendo mantenimiento o el error es menor (como un "permiso denegado"), ejecutar primero `git gc --prune=now` puede ser suficiente.  

📌 **Resumen del flujo lógico:**  
1️⃣ Si no sabes si hay un problema → **`git gc --prune=now` primero** (para limpiar y posiblemente resolverlo).  
2️⃣ Si el problema persiste o hay corrupción confirmada → **`git fsck --full` primero** (para diagnosticar qué está roto).  

En mi caso como ya había archivos corruptos, lo ideal era empezar con `git fsck --full`, pero en situaciones generales, limpiar primero a veces resuelve los problemas más rápido. 🚀

---

**Ejemplo de limpieza**
lo siguiente es un ejemplo de lo que sal en la terminal:

**1. `git gc --prune=now`**
```sh
Enumerando objetos: 1989, listo.
Contando objetos: 100% (1989/1989), listo.
Compresión delta usando hasta 4 hilos
Comprimiendo objetos: 100% (1549/1549), listo.
Escribiendo objetos: 100% (1989/1989), listo.
Total 1989 (delta 342), reusados 1971 (delta 332), pack-reusados 0
```
✅ **Qué significa:**  
- Git **enumeró y contó** los objetos del repositorio.  
- **"Compresión delta usando hasta 4 hilos"** → Git usó 4 hilos de CPU para comprimir objetos, optimizando el almacenamiento.  
- **"Reusados 1971 (delta 332)"** → 1971 objetos ya estaban en el repositorio y no se duplicaron.  
- **"Pack-reusados 0"** → No había paquetes de objetos antiguos que se pudieran reutilizar.  

📌 **Conclusión:** Tu repositorio se compactó correctamente y no hay objetos innecesarios.

**2. `git fsck --full`**
```sh
Revisando objetos directorios: 100% (256/256), listo.
Revisando objetos: 100% (1989/1989), listo.
Verificando commits en commit graph: 100% (61/61), listo.
```
✅ **Qué significa:**  
- **"Revisando objetos directorios"** → Git verificó que la estructura del repositorio es válida.  
- **"Revisando objetos: 100% (1989/1989), listo."** → Todos los objetos fueron verificados y no se encontraron problemas.  
- **"Verificando commits en commit graph: 100% (61/61), listo."** → El historial de commits está completo y sin errores.  

📌 **Conclusión:** **No hay corrupción en el repositorio. Todo está en orden.** 🚀  

Si antes tenías problemas de objetos corruptos y ahora ya no aparecen, significa que `git gc` ayudó a limpiar los errores. Ahora tu repo está en buen estado. 💪


---

## **4. No interrumpas operaciones de Git** 🚦  
Si ejecutas un comando como `git push` o `git pull`, evita cerrarlo a la mitad, ya que esto puede dejar archivos corruptos en `.git/objects/`.  

Si te quedas sin conexión durante `git push`, intenta abortarlo con:  
```sh
git fetch --prune
```

---

## **5. Guarda copias de seguridad del repositorio** 💾  
Puedes crear un archivo comprimido con el contenido del repositorio regularmente, dale clic derecho y comprimir y ponle algún nombre que indice que es un respaldo

O, si usas otra cuenta ejemplo GitLab, puedesimportar tu repositorio para también tenerlo allí


# Cómo revertir git add .

Si agregaste archivos al área de staging con `git add .` y quieres revertir la acción antes de hacer un commit, usa el siguiente comando:  

```sh
git reset
```

### Explicación:
- `git reset` sin argumentos deshace `git add` y devuelve los archivos al estado "unstaged", pero mantiene los cambios en tu directorio de trabajo.

Si solo quieres quitar un archivo específico del área de staging:
```sh
git reset nombre-del-archivo
```

Si también quieres descartar los cambios en los archivos (volver a la última versión confirmada):
```sh
git checkout -- nombre-del-archivo
```

Si ya hiciste commit pero quieres deshacerlo:
```sh
git reset --soft HEAD~1
```
Esto mantiene los cambios en staging pero deshace el último commit.




