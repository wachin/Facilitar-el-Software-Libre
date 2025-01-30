Here's a modern, clean CSS stylesheet that works well with Pandoc-generated HTML and Blogger's platform:

```css
/* blog-style.css - Modern Pandoc Markdown to HTML Styles */
:root {
    --primary-color: #2c3e50;
    --secondary-color: #3498db;
    --accent-color: #e74c3c;
    --text-color: #333;
    --background-color: #ffffff;
    --code-background: #f8f9fa;
    --border-color: #ecf0f1;
}

body {
    font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
    line-height: 1.7;
    color: var(--text-color);
    background-color: var(--background-color);
    margin: 0 auto;
    max-width: 800px;
    padding: 2rem 1rem;
}

h1, h2, h3, h4, h5, h6 {
    color: var(--primary-color);
    font-family: 'Lato', sans-serif;
    margin-top: 1.5em;
    margin-bottom: 0.5em;
}

h1 { 
    font-size: 2.5rem;
    border-bottom: 2px solid var(--secondary-color);
    padding-bottom: 0.3rem;
}

h2 { font-size: 2rem; }
h3 { font-size: 1.6rem; }

a {
    color: var(--secondary-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: var(--accent-color);
    text-decoration: underline;
}

code {
    background-color: var(--code-background);
    padding: 0.2em 0.4em;
    border-radius: 3px;
    font-family: 'Fira Code', 'Consolas', monospace;
    font-size: 0.9em;
}

pre {
    background-color: var(--code-background);
    padding: 1.5rem;
    border-radius: 8px;
    overflow-x: auto;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin: 1.5rem 0;
}

pre code {
    background-color: transparent;
    padding: 0;
    font-size: 0.95em;
    line-height: 1.6;
}

blockquote {
    border-left: 4px solid var(--secondary-color);
    margin: 1.5rem 0;
    padding: 0.5rem 1.5rem;
    color: #555;
    background-color: #f8f9fa;
    border-radius: 0 4px 4px 0;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 1.5rem 0;
    box-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

th, td {
    padding: 0.75rem;
    text-align: left;
    border-bottom: 1px solid var(--border-color);
}

th {
    background-color: var(--primary-color);
    color: white;
}

tr:nth-child(even) {
    background-color: #f8f9fa;
}

img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
    margin: 1rem 0;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

ul, ol {
    padding-left: 1.5rem;
    margin: 1rem 0;
}

li {
    margin-bottom: 0.5rem;
}

@media (prefers-color-scheme: dark) {
    :root {
        --primary-color: #ecf0f1;
        --text-color: #bdc3c7;
        --background-color: #2c3e50;
        --code-background: #34495e;
        --border-color: #7f8c8d;
    }
    
    th {
        background-color: #34495e;
    }
}

/* Blogger-specific adjustments */
.post-body {
    font-size: 1.1rem;
    line-height: 1.8;
}

.container {
    background-color: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.05);
}

@media (max-width: 768px) {
    body {
        padding: 1rem;
        font-size: 0.95rem;
    }
    
    h1 {
        font-size: 2rem;
    }
    
    pre {
        padding: 1rem;
    }
}
```

**Features of this stylesheet:**
1. Modern typography with system font stack
2. Responsive design with mobile support
3. Clean code blocks with syntax highlighting compatibility
4. Beautiful shadow effects and transitions
5. Dark mode support
6. Table styling
7. Blogger-specific adjustments
8. Flexible color variables using CSS custom properties
9. Proper spacing and hierarchy
10. Image styling with subtle shadows

**Usage:**  
1. Save this as `blog-style.css`
2. Convert your Markdown with Pandoc:
   ```bash
   pandoc input.md -o output.html --standalone --css=blog-style.css
   ```
   
   pandoc ejemplo-de-archivo-markdown-complejo.md -o output.html --standalone --css=blog-style.css
   
   
   pandoc input.md -o output.html --mathjax --highlight-style=pygments --css=blog-style.css
   
   pandoc input.md -o output.html --css=blog-style.css --no-highlight
   
3. For code syntax highlighting, add this to your Blogger template:
   ```html
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.24.1/themes/prism.min.css">
   ```

**Optional:** Add these fonts to your Blogger template's `<head>`:
```html
<link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&family=Fira+Code&display=swap" rel="stylesheet">
```

This stylesheet creates professional-looking blog posts that work well with both technical and general content, while maintaining good readability on all devices.


