# Reducir el tamaño del repositorio eliminando el historial .git

## Significado de "Copy the master branch only"

Un repositorio de GitHub no es solo el código; es la **combinación de todas sus ramas** (`master`, `main`, `develop`, `feature-x`, etc.) y todo su **historial de commits** (el gigantesco registro de cambios) dentro de la carpeta oculta `.git`.

1.  **Si la dejas marcada (Recomendado para tu caso):**

      * Tu nuevo *fork* solo incluirá la rama principal del repositorio original (`master` o `main`).
      * **NO** copiará ninguna otra rama de desarrollo, *features* antiguas, o ramas de prueba que el repositorio original pueda tener.
      * **Beneficio para ti:** Al no copiar ramas innecesarias, reduces la cantidad de historial de *commits* que se traen inicialmente. Esto se traduce en un **tamaño inicial de la carpeta `.git` mucho más pequeño**, lo cual es precisamente lo que quieres.

2.  **Si la desmarcas:**

      * Tu nuevo *fork* copiará **TODAS** las ramas existentes del repositorio original.
      * **Efecto:** El repositorio será más grande y contendrá todo el historial de esas ramas, lo cual no te sirve si tu objetivo es limpiarlo.

-----

## ¿Qué debes hacer para tu objetivo?

Para el objetivo que mencionaste (reducir el tamaño de la carpeta `.git` y el repositorio, pero mantener el *fork*), te recomiendo seguir estos dos pasos:

### 1\. En el paso del Fork (Ahora)

**✅ Acción:** **Deja la casilla "Copy the master branch only" MARCADA.**

Esto asegura que tu *fork* sea lo más pequeño posible desde el inicio.

### 2\. Después del Fork (Siguiente paso)

A pesar de marcar la casilla, el historial de *commits* de la rama `master` original sigue siendo grande (todo el código que quieres eliminar está en ese historial).

Para reemplazarlo por completo con tu versión más pequeña y compacta, **deberás aplicar la técnica de reescribir la historia** que te mencioné en la respuesta anterior, que es usar la rama huérfana (`git checkout --orphan`).

-----

### Resumen del proceso completo (Ahora que tienes el fork limpio)

Una vez que completes el *fork* con la opción marcada, ve a tu terminal y aplica estos comandos para reescribir la historia y reducir el tamaño del repositorio al mínimo:

1.  **Clonar:**

    ```bash
    git clone https://www.spanishdict.com/translate/fork
    cd [nombre-del-repositorio]
    ```

2.  **Crear una rama huérfana (sin historia) para tu nuevo código:**

    ```bash
    git checkout --orphan nueva-version
    ```

3.  **Limpiar el directorio de trabajo y añadir tu nuevo código:**

    ```bash
    git rm -rf .
    # Copia o mueve tu código pequeño aquí
    cp -r /ruta/a/tu/codigo/nuevo/* .
    ```

4.  **Hacer el *commit* único y forzar la subida:**

    ```bash
    git add .
    git commit -m "Inicio de la nueva versión optimizada"
    git push origin nueva-version
    ```

5.  **Reemplazar la rama principal (destructivo para la historia):**

    ```bash
    git checkout master # o main
    git reset --hard nueva-version
    git push origin master --force # O main --force
    ```

Al hacer esto, lograrás las tres cosas: **mantener el estado de *fork***, **borrar el contenido antiguo** y **reducir el tamaño de `.git`** a solo tu *commit* inicial de la nueva versión.