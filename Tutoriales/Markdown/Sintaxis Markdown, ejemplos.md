Markdown/01 Sintaxis Markdown, ejemplos

**Cajas de código**
que no importa lo que vaya dentro no afectará el formato:

```bat
cd \
copy a b
ping 192.168.0.1
```


```dos
cd \
copy a b
ping 192.168.0.1
```

**Bloque de citas:**

> Blockquote.
hola cómo están

>> Second paragraph in the blockquote, nested.


**Encabezado 2**

Equivalente a Header 2, o H2

> ## This is an h2 in a blockquote


font-family: 'Droid Mono', Consolas, 'Andale Mono', 'Courier New', monospace;

<code>
hola cómo están
espero estén bien el día de hoy
y bueno
pero pasará eso verdad
</code>



<pre>
Claro como están todos
bueno espero estén bien
y bueno, todos noe veremos después
</pre>

How do I add Markdown formatting in a code / pre block? - Stack Overflow
https://stackoverflow.com/questions/10063896/how-do-i-add-markdown-formatting-in-a-code-pre-block

<pre>
int main(void) {
    <b>return 0;</b>
}
</pre>



<p>remove this and it should work fine</p>

<pre>
       <span>this should not be escaped</span>
</pre>


This code block will render correctly if you do one of the following things:
1- remove the p tag at the beginning
2- remove the extra space after pre

According to http://spec.commonmark.org/0.23/#html-blocks, this fits condition number 1 of having a a line begins with pre. Anything inside should not be escaped and rendered as is.


Pre > Code tags with markup create unexpected results · Issue #187 · markdown-it/markdown-it
https://github.com/markdown-it/markdown-it/issues/187

> #### The quarterly results look great!
>
> - Revenue was off the chart.
> - Profits were higher than ever.
>
>  *Everything* is going according to **plan**.


Alignment

You can align text in the columns to the left, right, or center by adding a colon (:) to the left, right, or on both side of the hyphens within the header row

| Syntax      | Description | Test Text     |
| :---        |    :----:   |          ---: |
| Header      | Title       | Here's this   |
| casa   | Text        | And more      |
| casa   | Text        | And more      |
| casa   | Text        | And more      |
| casa   | Text        | And more      |


```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

Footnotes

Footnotes allow you to add notes and references without cluttering the body of the document. When you create a footnote, a superscript number with a link appears where you added the footnote reference. Readers can click the link to jump to the content of the footnote at the bottom of the page.

To create a footnote reference, add a caret and an identifier inside brackets ([^1]). Identifiers can be numbers or words, but they can’t contain spaces or tabs. Identifiers only correlate the footnote reference with the footnote itself — in the output, footnotes are numbered sequentially.

Add the footnote using another caret and number inside brackets with a colon and text ([^1]: My footnote.). You don’t have to put footnotes at the end of the document. You can put them anywhere except inside other elements like lists, block quotes, and tables.

Here's a simple footnote,[^1] and here's a longer one.[^bignote]

[^1]: This is the first footnote.

[^bignote]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.
    
    `{ my code }`
    
    Add as many paragraphs as you like.

The rendered output looks like this:

Here’s a simple footnote,1 and here’s a longer one.2

~~~~
This is a
piece of code
in a block
~~~~


Si necesitas menciona en un tutorial el código de una caja de código en markdown que van encerradas con ``` al inicio y al final ``` se las puede mostrar así:

~~~~
```python
import requests

def check_requests():
    try:
```
~~~~


Dios les bendiga

