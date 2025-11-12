# Cómo Eliminar el Historial Pesado de un Fork de GitHub (Sin Perder la Conexión)

Si has *forkeado* un repositorio grande en GitHub y solo quieres quedarte con tu versión del código (mucho más pequeña y limpia), pero sin perder el estado de **"fork"** (la relación con el repositorio original), este tutorial te mostrará cómo **reescribir la historia de Git** para reducir drásticamente el tamaño del repositorio y la carpeta oculta `.git`.

## ⚠️ Advertencia Importante: Operación Destructiva

Este proceso es **destructivo** para el historial de *commits* de tu rama principal del Fork o cualquier repo. Una vez que lo aplicas, **el historial antiguo desaparece permanentemente** de tu *fork* y del servidor de GitHub. **Asegúrate de no necesitar ese historial** antes de continuar.

## Paso 0: Preparación (Clonar y Código Nuevo)

Asumiremos que ya hiciste el *fork* en GitHub y tienes tu código nuevo, optimizado y pequeño listo para ser integrado.

1.  **Clona tu *fork* a tu máquina local:**

```bash
git clone https://www.github.com/tuusuario/elfork
cd [nombre-del-repositorio]
```

## Paso 1: Crear una Nueva Historia 'Huérfana' (Orphan Branch)

Usaremos el *flag* `--orphan` para crear una rama que **no tenga ningún *commit* padre**, es decir, una rama sin historial.

1.  **Crea y cambia a la nueva rama huérfana:**

```bash
git checkout --orphan nueva-version
```

2.  **Elimina el contenido del directorio de trabajo:**
    Usamos `git rm -rf .` para eliminar todos los archivos del *anterior* historial de Git, pero sin tocar la base de datos de Git (`.git`).

```bash
git rm -rf .
```

## Paso 2: Introducir y Confirmar el Código Nuevo

Ahora, introduce tu versión reducida del código en el directorio y crea el primer (*y único*) *commit* de la nueva historia.

1.  **Copia tu nuevo código** al directorio del repositorio (sobrescribiendo o añadiendo lo necesario).

```bash
cp -r /ruta/a/tu/codigo/nuevo/* .
```

2.  **Confirma el código nuevo:**

```bash
git add .
git commit -m "Inicio de la nueva versión optimizada (Commit Raíz)"
```

3.  **Sube esta nueva rama** temporal a GitHub:

```bash
git push origin nueva-version
```

## Paso 3: Reemplazar la Rama Principal (Master/Main)

Ahora sobreescribiremos la rama principal (que aún contiene el historial pesado) con el *commit* limpio que acabamos de crear.

1.  **Vuelve a la rama principal:**

```bash
git checkout master # o git checkout main
```

2.  **Reemplaza el historial de la rama principal:**
    Este comando hace que `master` apunte exactamente al mismo *commit* que `nueva-version`. **¡Esto elimina todo el historial antiguo de la rama\!**

```bash
git reset --hard nueva-version
```

3.  **Fuerza la subida a GitHub:**
    Debes usar `--force` porque estás sobreescribiendo el historial remoto completo.

```bash
git push origin master --force # o git push origin main --force
```

*En este punto, el repositorio en GitHub ya solo contiene tu *commit* único, y sigue siendo un *fork*.*

## Paso 4: Limpiar la Carpeta .git Local (Reducción de Tamaño)

Aunque la historia ya desapareció de la rama, Git aún guarda los objetos antiguos en tu carpeta local **`.git`** por un tiempo (en caso de que quieras revertir). Revisa el tamño de .git dandole clic derecho y ver en Propiedades

Para liberar ese espacio, necesitamos forzar a Git a ejecutar su proceso de **recolección de basura** (`Garbage Collection`).

1.  **Vence el periodo de gracia de los objetos huérfanos:**
    Esto marca el historial antiguo como inmediatamente eliminable.

```bash
git reflog expire --expire=now --all
```

2.  **Ejecuta la recolección de basura y la compactación:**
    Este es el comando mágico que **reduce el tamaño de `.git`**.

```bash
git gc --prune=now
```

3.  **Verifica el nuevo tamaño (opcional):**

```bash
du -sh .git
```

*Deberías ver una reducción drástica, ejemplo yo tenía un fork de un repositorio que tenía 40 MB y después de aplicar esto qeudó en 100 kilobytes.*


## Paso 5: Limpieza Final (Opcional)

Puedes eliminar la rama temporal que creaste:

1.  **Borra la rama local:**  

```bash
git branch -D nueva-version
```

Ahora tu *fork* contiene solo tu código limpio, tiene un historial mínimo y el tamaño de tu carpeta `.git` es el más reducido posible, manteniendo intacta la relación de *fork* con el repositorio original.
