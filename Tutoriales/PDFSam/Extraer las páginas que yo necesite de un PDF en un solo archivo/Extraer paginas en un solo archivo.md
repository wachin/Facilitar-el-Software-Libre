Tutorial de uso de PDFSam.- En MX Linux 21 está la versión 4.2.2 y usaré esta para solucionar unos problemas:

PROBLEMA 1
Tengo un PDF que tiene 298 páginas y las páginas están en orientación horizontal (exepto la 1ra y 2da que son verticales y contienen las portadas). Las páginas horizontales tienen 292 x 200 mm, lo que significa:

292 mm (29,2 cm) de ancho
200 mm (20 cm) de alto

Este PDF es de un libro escaneado y cada página tiene dos páginas del libro. La página 9 en el lado izquierdo no tiene nada y en el lado derecho está el PROLOGO que en el pie de página dice 9, la página 10 a la izquierda tiene rebanada la página 10 y a la derecha la página 21. La página 13 tiene escaneada a la izquierda la página 16 y a la derecha la 17, y así sucesivamente

Tengo que leer del libro desde la página 151 a la página 174 del libro escaneado

SOLUCIÓN
Para hacer eso debo dar clic en la sección:

Extraer

Allí arrastrar un PDF

BUSCAR en el PDF la página 151 del libro escaneado que al encontrarla corresponde a la página 80 del PDF, y así mismo la página 174 del libro escaneado que al encontrarla corresponde a la página 92 del PDF, entonces, en PDFsam en:

Ajustes de extracción

escribir:

80-92

y dar clic en:

Ejecutar

Al hacer esto se creará un archivo PDF que contendrá las páginas 80 y 92 del PDF que contienen las páginas escaneadas del libro desde la 151 a 174
