LaTeX es un lenguaje muy potente para escribir fórmulas matemáticas. Esta es una guía básica para que puedas escribir fórmulas en Markdown usando LaTeX:

### Fórmulas en línea

Para escribir una fórmula matemática en línea, usa el símbolo `$` antes y después de la fórmula. Por ejemplo:

```markdown
Esto es una fórmula en línea: $E=mc^2$
```

Esto se verá como: Esto es una fórmula en línea: $E=mc^2$

### Fórmulas en bloque

Para escribir una fórmula en bloque, usa dos símbolos `$$` antes y después de la fórmula. Por ejemplo:

```markdown
$$
\int_0^\infty e^{-x} \, dx = 1
$$
```

Esto se verá como:

$$ 
\int_0^\infty e^{-x} \, dx = 1 
$$

### Símbolos básicos

Aquí tienes algunos ejemplos de símbolos matemáticos comunes en LaTeX:

- **Fracciones:** `\frac{a}{b}` → $\frac{a}{b}$
- **Exponentes y subíndices:** `a^2` y `a_i` → $a^2$ y $a_i$
- **Raíces:** `\sqrt{x}` y `\sqrt[n]{x}` → $\sqrt{x}$ y $\sqrt[n]{x}$
- **Suma y producto:** `\sum_{i=1}^n i` y `\prod_{i=1}^n i` → $\sum_{i=1}^n i$ y $\prod_{i=1}^n i$
- **Integrales:** `\int_{a}^{b} f(x) \, dx` → $\int_{a}^{b} f(x) \, dx$

### Ejemplos más avanzados

- **Matrices:**

```markdown
$$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
$$
```

Esto se verá como:

$$ 
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
$$

- **Ecuaciones alineadas:**

```markdown
$$
\begin{align}
a & = b + c \\
d & = e + f
\end{align}
$$
```

Esto se verá como:

$$ 
\begin{align}
a & = b + c \\
d & = e + f
\end{align}
$$

### Usando LaTeX en Typora

Typora admite la sintaxis de LaTeX para las matemáticas. Solo necesitas asegurarte de que las ecuaciones estén escritas entre los delimitadores `$...$` para las ecuaciones en línea y `$$...$$` para las ecuaciones en bloque, tal como se muestra en los ejemplos anteriores.

# Ejemplos

¡Por supuesto! A continuación, te mostraré cómo se verá cada uno de los ejemplos de símbolos básicos que te di anteriormente:

1. **Fracciones:**

   ```markdown
   \frac{a}{b}
   ```

   Se verá así:

   $$
   \frac{a}{b}
   $$

2. **Exponentes y subíndices:**

   ```markdown
   a^2
   ```

   Se verá así:

   $$
   a^2
   $$

   ```markdown
   a_i
   ```

   Se verá así:

   $$
   a_i
   $$

3. **Raíces:**

   ```markdown
   \sqrt{x}
   ```

   Se verá así:

   $$
   \sqrt{x}
   $$

   ```markdown
   \sqrt[n]{x}
   ```

   Se verá así:

   $$
   \sqrt[n]{x}
   $$

4. **Suma y producto:**

   ```markdown
   \sum_{i=1}^n i
   ```

   Se verá así:

   $$
   \sum_{i=1}^n i
   $$

   ```markdown
   $\prod_{i=1}^n i$
   ```

   Se verá así:

   $$
   \prod_{i=1}^n i
   $$

5. **Integrales:**

   ```markdown
   \int_{a}^{b} f(x) \, dx
   ```

   Se verá así:

   $$
   \int_{a}^{b} f(x) \, dx
   $$

