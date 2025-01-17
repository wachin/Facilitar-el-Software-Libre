Aquí te dejo una plantilla básica de Pandoc para convertir archivos Markdown a HTML5 con un estilo elegante para Blogger. Puedes personalizarla según tus necesidades:

```yaml
---
title: "Tu Título Aquí"
author: "Tu Nombre"
date: "auto"
css: "styles.css"
toc: true
toc-depth: 3
numbersections: true
highlight-style: pygments
---

# Aquí empieza tu contenido Markdown
```

**Explicación de los parámetros:**

- `title`: Puedes especificar un título o dejarlo vacío para usar el nombre del archivo.
- `author`: Pon tu nombre o el nombre del autor del post.
- `date`: Utiliza "auto" para que Pandoc coloque la fecha actual.
- `css`: Aquí puedes enlazar un archivo CSS para darle estilo al HTML. Puedes diseñar este CSS para que se adapte al diseño de Blogger.
- `toc`: Si es `true`, Pandoc genera una tabla de contenidos.
- `toc-depth`: Establece la profundidad de la tabla de contenidos (número de niveles).
- `numbersections`: Si es `true`, las secciones serán numeradas.
- `highlight-style`: Define el estilo de resaltado de sintaxis para bloques de código (puedes cambiar `pygments` por otro si prefieres).

**Ejemplo de `styles.css`:**

```css
body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

h1, h2, h3, h4 {
    color: #2c3e50;
    border-bottom: 2px solid #e67e22;
    padding-bottom: 10px;
}

a {
    color: #e67e22;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

pre {
    background-color: #f8f8f8;
    padding: 10px;
    border: 1px solid #ddd;
    overflow-x: auto;
}

code {
    font-family: 'Courier New', Courier, monospace;
    background-color: #f4f4f4;
    padding: 2px 4px;
    border-radius: 4px;
}
```

**Uso:**

1. Crea un archivo `.md` con tu contenido.
2. Usa Pandoc para convertirlo a HTML con el siguiente comando:

```bash
pandoc input.md -o output.html --template=tu-plantilla.yml
```

3. Sube el archivo HTML a Blogger.

Este es un punto de partida; puedes ajustar el CSS y los parámetros según el estilo que desees para tus publicaciones en Blogger.






Aquí te dejo un archivo `styles.css` mejorado, diseñado para un blog de tecnología moderna, con énfasis en la presentación de código y notas de manera atractiva:

```css
/* General Styles */
body {
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    line-height: 1.7;
    color: #333;
    background-color: #f5f7fa;
    margin: 0;
    padding: 20px;
    max-width: 900px;
    margin: 0 auto;
}

h1, h2, h3, h4, h5, h6 {
    color: #2d2d2d;
    font-weight: 700;
    margin-top: 1.5em;
    margin-bottom: 0.5em;
    border-bottom: 2px solid #3498db;
    padding-bottom: 10px;
}

p {
    margin-bottom: 1.2em;
}

a {
    color: #3498db;
    text-decoration: none;
    font-weight: 500;
}

a:hover {
    text-decoration: underline;
    color: #2980b9;
}

/* Code and Preformatted Text */
pre, code {
    font-family: 'Fira Code', monospace;
    background-color: #2d2d2d;
    color: #ecf0f1;
    border-radius: 5px;
    padding: 10px;
    overflow-x: auto;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

pre {
    margin-bottom: 1.5em;
    background-color: #2c3e50;
    padding: 20px;
}

code {
    background-color: #34495e;
    padding: 2px 6px;
    font-size: 0.95em;
    border-radius: 4px;
}

pre code {
    padding: 0;
    background: none;
}

/* Blockquotes for Notes */
blockquote {
    border-left: 5px solid #3498db;
    margin: 20px 0;
    padding: 15px 20px;
    background-color: #ecf0f1;
    color: #2c3e50;
    font-style: italic;
    border-radius: 5px;
}

blockquote p {
    margin: 0;
}

/* Tables */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 1.5em;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

table th, table td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
}

table th {
    background-color: #3498db;
    color: #fff;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Images */
img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
    margin-bottom: 1.5em;
}

/* Lists */
ul, ol {
    margin: 1.5em 0;
    padding-left: 1.5em;
}

li {
    margin-bottom: 0.5em;
}

/* Responsive Design */
@media (max-width: 768px) {
    body {
        padding: 15px;
    }

    h1, h2, h3, h4, h5, h6 {
        font-size: 1.2em;
    }

    pre, code {
        font-size: 0.9em;
    }
}
```

### Explicación de las mejoras:

- **Tipografía moderna:** Se utiliza la fuente `Roboto` para el texto general y `Fira Code` para el código, dando un aspecto moderno y limpio.
- **Colores:** Se seleccionaron colores que son agradables a la vista y que destacan bien en pantalla, con tonos de azul y gris oscuro para un enfoque tecnológico.
- **Código:** Los bloques de código (`pre`) y el código en línea (`code`) tienen fondos oscuros y están resaltados, con bordes redondeados y sombra para un look elegante y profesional.
- **Notas (`blockquote`):** Las notas están estilizadas con un borde lateral azul y fondo gris claro, que se integra bien con el tema general y se distingue del contenido regular.
- **Tablas:** Las tablas tienen un diseño limpio con encabezados en azul y filas alternadas para una mejor legibilidad.
- **Responsive:** El diseño es adaptable a dispositivos móviles, asegurando que el contenido se vea bien en pantallas pequeñas.

Con este estilo, tu blog de tecnología tendrá una apariencia profesional y moderna, perfecta para compartir contenido relacionado con software y programación.
