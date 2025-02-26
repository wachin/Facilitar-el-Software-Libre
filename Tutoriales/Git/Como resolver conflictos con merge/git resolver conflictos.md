# Cómo resolver conflictos en un repositorio git con merge el cuál está siendo trabajado desde dos ordenadores diferentes

Tengo un repositorio de mi proyecto RisenPC Fluxbox y con frecuencia lo edito desde dos ordenadores diferentes, y estas son unas investigaciones para saber como usar git para mantener sincronizados los repositorios resolviendo los conflictos entre ellos, para saber cómo verificar las diferencias entre la rama local y la rama remota. Aquí pasos detallados:

### 1. Clonar el repositorio
Clonar el repositorio a tu máquina local:

```bash
git clone https://github.com/wachin/RisenPC-Fluxbox-ES
cd RisenPC-Fluxbox-ES
```

### 2. Hacer `fetch`
Obtén los cambios más recientes del repositorio remoto sin aplicarlos todavía:
```bash
git fetch origin
```

### 3. Verificar las diferencias
Para ver las diferencias entre tu rama local y la rama remota, puedes usar `git diff`. Asumiendo que estás en la rama `main`:

```bash
git diff main origin/main
```

Este comando te mostrará las diferencias entre tu rama `main` local y la rama `main` en el repositorio remoto. Verás qué líneas se han añadido, modificado o eliminado en comparación con tu copia local.

### 4. Revisar el estado de tu rama local
Puedes verificar el estado de tu rama local con:
```bash
git status
```

Esto te dará una idea de si hay cambios pendientes en tu rama local que no se han comprometido.

### 5. Fusionar los cambios
Si estás listo para fusionar los cambios del repositorio remoto en tu rama local, puedes hacer:

```bash
git merge origin/main
```

### Ejemplo Completo
A continuación, un ejemplo completo de todos los pasos juntos:

```bash
# Clonar el repositorio (si no lo has hecho)
git clone https://github.com/wachin/RisenPC-Fluxbox-ES
cd RisenPC-Fluxbox-ES

# Hacer fetch para obtener los cambios más recientes
git fetch origin

# Verificar las diferencias entre tu rama local y la rama remota
git diff main origin/main

# Fusionar los cambios de la rama remota en tu rama local
git merge origin/main

# Verificar el estado de tu repositorio
git status
```

### Resolver Conflictos (si los hay)
Si hay conflictos durante el merge, Git te avisará y tendrás que resolverlos manualmente. Abre los archivos con conflictos, realiza los cambios necesarios y luego marca los archivos como resueltos:

```bash
# Editar archivos con conflictos y resolver los cambios
git add [archivo-con-conflicto]

# Finalizar el merge
git commit
```

Siguiendo estos pasos, deberías poder verificar y fusionar los cambios del repositorio remoto en tu rama local sin problemas.

Si alguna vez se daña un repositorio y te sale algún mensaje como este:

```bash
wachin@mx23KDE:~/Dev/wa21
$ git status
fatal: objeto suelto 692e0a3c4b6e4a93f23e0df85333416686ffc6ce (guardado en .git/objects/69/2e0a3c4b6e4a93f23e0df85333416686ffc6ce) está corrompido
```

lo que hago yo es dejarlo allí como está, y descargar el repositorio otra vez pero en otra carpeta:

```bash
git clone https://github.com/wachin/wi21
```
y luego abrir meld (hay que tenerlo instalado) y comparar las dos carpetas y copiar los cambios que no pude enviar del repositorio dañado y sincronizarlos, y cuando esté, borrar el repositorio dañado.







