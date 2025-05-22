Aquí tienes la traducción al español de la ayuda del servicio

**[https://htmlmarkdown.com/](https://htmlmarkdown.com/)**:

---

# Convertidor de HTML a Markdown

Para usar el convertidor de HTML a Markdown, simplemente pega o escribe tus datos en formato HTML en el editor de texto de entrada a la izquierda. Mientras escribes, HTML2Markdown convierte automáticamente tu código HTML al formato Markdown que puedes ver a la derecha.

HTML
`<h1>htmlmarkdown.com Convertidor de HTML a Markdown</h1>`
`<p>La mejor herramienta si quieres convertir HTML5 a Markdown.</p>`
`<hr />`
`<p>Está diseñado para ser compatible con <a href="http://commonmark.org/" target="_blank" rel="noopener">CommonMark</a>, e incluye opciones para personalizar el estilo de salida. Estas opciones incluyen:</p>`
`<ul>`
`  <li>headingStyle (setext o atx)</li>`
`  <li>horizontalRule (*, - o _)</li>`
`  <li>bullet (*, - o +)</li>`
`  <li>codeBlockStyle (indentado o delimitado)</li>`
`  <li>fence (\` o ~)</li>`
`  <li>emDelimiter (_ o *)</li>`
`  <li>strongDelimiter (** o __)</li>`
`  <li>linkStyle (en línea o referenciado)</li>`
`  <li>linkReferenceStyle (completo, contraído o acceso directo)</li>`
`</ul>`

---

## Estilo de títulos (Heading style)

Los títulos en Markdown se pueden escribir usando dos estilos diferentes:

### ATX
El estilo ATX utiliza símbolos `#` antes del texto del título. El número de `#` indica el nivel del título:
- `# Título 1` → Encabezado de nivel 1 (más grande)
- `## Título 2` → Encabezado de nivel 2
- ...
- `###### Título 6` → Encabezado de nivel 6

### Setext
El estilo Setext utiliza líneas subrayadas con signos iguales `=` o guiones `-` para definir los encabezados:
- `=`, para un encabezado de nivel 1 (H1)
- `-`, para un encabezado de nivel 2 (H2)

**Ejemplo:**
```
Este es un H1
==============
```
```
Este es un H2
--------------
```

Solo se pueden crear encabezados de nivel 1 y 2 con este estilo. Para niveles superiores (H3 a H6), usa el estilo ATX.

---

## Regla horizontal (Horizontal Rule)

Una regla horizontal es una línea que separa secciones de texto. Puedes crear una con tres o más guiones (`---`), asteriscos (`***`) o guiones bajos (`___`) en una línea vacía:

```
---
```

---

## Viñetas (Bullet)

Las viñetas se utilizan para crear listas no ordenadas. Empieza cada línea con un guion `-`, asterisco `*` o signo más `+`, seguido de un espacio:

```
- Elemento 1
* Elemento 2
+ Elemento 3
```

---

## Estilo de bloques de código (Code Block Style)

Markdown soporta dos estilos de bloques de código:

### Indentado
Cada línea del bloque está indentada con cuatro espacios:

    Esto es un bloque de código indentado

### Delimitado
Se rodea el contenido con tres comillas invertidas `` ``` `` o tres tildes `~~~`. También puedes indicar el lenguaje del código para resaltado sintáctico:

```
```python
print("¡Hola, mundo!")
```
```

---

## Delimitadores de énfasis (Emphasis Delimiter)

Para texto en cursiva, envuelve el texto con un asterisco `*` o un guion bajo `_`:

- `*cursiva*` o `\_cursiva\_` → *cursiva*

---

## Delimitadores de negrita (Strong Delimiter)

Para texto en negrita, usa dos asteriscos `**` o dos guiones bajos `__`:

- `**negrita**` o `__negrita__` → **negrita**

---

## Estilo de enlaces (Link Style)

### En línea
Coloca el texto del enlace entre corchetes y la URL entre paréntesis:

```
[Google](https://www.google.com)
```

### Referenciado
Usa una etiqueta de referencia después del texto del enlace y define la URL más adelante:

```
[Google][1]
[1]: https://www.google.com
```

---

## Estilo de referencia de enlaces (Link Reference Style)

Organiza tus enlaces al final del documento para mantener el texto limpio. Ejemplo:

```
Este es [un ejemplo][ejemplo-enlace] de enlace por referencia.
[ejemplo-enlace]: http://ejemplo.com/
```

---

## Compatibilidad con CommonMark

El convertidor está diseñado para cumplir con las normas de **CommonMark**, un estándar ampliamente aceptado para el lenguaje Markdown. Esto asegura que el resultado sea consistente y compatible con otras herramientas que usan Markdown.

---

## Opciones de configuración del convertidor

Puedes elegir cómo deseas que se vea el Markdown resultante ajustando estas opciones:

| Opción | Descripción |
|-------|-------------|
| `headingStyle` | Usa `setext` o `atx` para los encabezados |
| `horizontalRule` | Usa `*`, `-` o `_` para las líneas horizontales |
| `bullet` | Usa `*`, `-` o `+` para las viñetas |
| `codeBlockStyle` | Usa `indentado` o `fenced` (delimitado) para bloques de código |
| `fence` | Usa comillas invertidas <code>\`</code> o tildes `~` para bloques delimitados |
| `emDelimiter` | Usa `_` o `*` para cursiva |
| `strongDelimiter` | Usa `**` o `__` para negrita |
| `linkStyle` | Usa `inlined` (en línea) o `referenced` (referenciado) para los enlaces |
| `linkReferenceStyle` | Usa `full` (completo), `collapsed` (contraído) o `shortcut` (acceso directo) |

---

Esperamos que esta guía te ayude a aprovechar al máximo el convertidor de HTML a Markdown de [htmlmarkdown.com](https://htmlmarkdown.com/). ¡Convierte tu HTML fácilmente a un formato legible y portable!
