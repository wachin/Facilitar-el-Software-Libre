# En Markdown diferencias en los métodos "Math mode" y "Display mode"


En Markdown, los métodos "Math mode" y "Display mode" se utilizan para incluir expresiones matemáticas, y la diferencia principal entre ellos radica en cómo se presentan visualmente las fórmulas:

1. **Math mode** (`$ ... $`):  
   - Todo lo que esté entre un par de signos de dólar (`$ ... $`) se muestra en "modo en línea" (inline), es decir, junto con el texto sin ocupar una línea completa.
   - Por ejemplo, `$ \sum_{n=1}^{\infty} $` se vería como $\sum_{n=1}^{\infty}$, incrustado dentro del texto.
   - Este método es útil para expresiones cortas que forman parte de una oración.

2. **Display mode** (`$$ ... $$`):  
   - Cuando se usa un par doble de signos de dólar (`$$ ... $$`), el contenido se muestra en "modo de visualización" (display mode), ocupando toda una línea y centrado.
   - Por ejemplo, `$$ \sum_{n=1}^{\infty} $$` se vería así:
    $$
    \sum_{n=1}^{\infty}
    $$
   - Esto es útil para expresiones más largas o para destacar fórmulas complejas que necesitan espacio adicional.

En resumen, el "Math mode" (`$ ... $`) es para expresiones en línea, mientras que el "Display mode" (`$$ ... $$`) es para expresiones en bloque y centradas.