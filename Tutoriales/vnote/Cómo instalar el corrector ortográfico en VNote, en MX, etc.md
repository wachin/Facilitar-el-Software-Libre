# Cómo instalar el correcctor ortográfico en VNote editor de Markdown, en MX Linux Debian, Ubuntu, Mint, etc

Para mi VNote es el mejor editor de Markdown gratuito. Este tutorial es para instalar el corrector ortográfico que necesita para VNote AppImage pues no lo tiene integrado sino que hay que instalarlo por separado

## Descarga VNote AppImage

VNote es multiplataforma, está disponible también para Windows, MAC OS. Para Linux esa AppImage debe funcionar en Ubuntu, MX Linux, Linux Mint, y otros Sistemas Operativos basados en ellos:

[https://github.com/vnotex/vnote/releases](https://github.com/vnotex/vnote/releases)

Una vez descargado, descomprime el archivo y con clic derecho y en la pestaña permisos verifica que esté marcado como ejecutable y luego dale doble clic

Al abrirse, arriba en la esquina derecha están tres puntitos (⋮) dale clic en:

**\> Settings > Editor > Spell check dictionary > Add Dictionary**

Aparece un mensaje que dice:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEikqXKCUcx6iKgCdXJnpWvKRBSjdZmTYnABhDCtGT-j2ltZ9dAHlEuLr0e9LMlNy7LZJAD97Elk8ezNmuDG1ZHLTEYnJd8Yk3Lo03P0boxNkM1puI3rmRa_YPF-FQbsC-e5onBQ_81KGhTFoJQEqy0WUi7Gv2skaXFe8BOroEs5DpD9kNhg1ksiqMiFisE/s16000-rw/20250509-0010%20Como%20ponerle%20un%20diccionario%20a%20VNote%20AppImage.png)

  
ese mensaje traducido al español dice:

> "VNote usa [https://hunspell.github.io](https://hunspell.github.io) para la corrección ortográfica
> Por favor descargue un diccionario Hunspell y póngalo dentro de:
> .config/VNote/VNote/dicts
> y reinicie VNote"

## Instala el corrector ortográfico Hunspell y el idiona que necesite

Busca en Synaptic (si no lo tienes instalado instalalo) un diccionario Hunspell, ejemplo del idioma español:

**hunspell-es**

instálalo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgC2nNDNsIVtSxzY8DBd4kgNy6y4-aFnKaS4UDMO__3r8obo8RJWXA2D8G9OGN0zIJpmOapKIGYzuoNxD_165cFf-hw7V5W6TrLwTDefEaJ4a2U_-ookU5xHNGfeeaBa4uMFGtodyoOsc6KfgVXfwZ5HRtgM-ZTXx7yCnVuv_rPb82aTJEA2oZRhP-W8P4/s16000-rw/20250509-0012%20busca%20un%20diccionario%20Hunspell%20ejemplo%20espa%C3%B1ol%20en%20Synaptic.png)

Allí hay otros diccionarios de otros idiomas, si necesitas otro puedes instalar más

Cuando se haya instalado, allí en Synaptic dale clic derecho al nombre del paquete, y en "**Propiedades**" y busca los **Archivos instalados** de los diccionarios :

.dic

.aff

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEge9NMcspgBTZXGoCEpNEw4BmBiYW13INgD50VCXL65c77yuXwolK0Hc85VexOn7TK5B-6kFhIdUb9gxLOEBWhihAvZujOeJH-oqCTHeHfwAZBeJ1s81z0Ng-HJdboziDC5CZwFpGcckxz4De8CDxDujn4XxqLnAorQcDa-wIxVH4mvgJ6DH0WQMtB9TLo/s16000-rw/20250509-0013%20hunspell%20archivos%20que%20contiene%20el%20diccionario.png)

  
Tome nota de cuales son. Copia esa ruta:

/usr/share/hunspell/ 

pégala "Ctrl + L" al administrador de archivos y entra allí, y selecciona con cuidado para copiar sólo todos los archivos que el paquete instaló, bueno también si dedea sólo los que usted quiera poner allí:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2f5w6-KJtT1FkPjpRFY2ZGKU3uCm_RT_1EwCPGVgvO9B1ZiA-oWPhd4X9soLbbURoUvZHirhW_6sRKY6-S5FUqMYxiCYMfG68PC7v0QV5QrcgV5TWN3KT-j52cUAci_V1a1zKIxx5IZ2QiwLM67OkKW41PWcawJZOuIQCq7iND4yUgtGmaqcTnLV1t-w/s16000-rw/20250509-0014%20copiando%20manualmente%20los%20archivos%20de%20Hunspell.png)

  
 y has visibles los archivos ocultos con "Ctrl + H" y entra en:

.config/VNote/VNote/dicts

Pega los diccionarios allí

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg1mZp3CMTpNo-tzG_EMBNo8ccE5sOdSkm0GY3fmQL4w21GaphnvQ3RgL0albX4USzP0nJy1Ssn3fzEQ9mIIcHDJQ7_nTGLaqxRbwooUhdTIUfFk6eSgKb9t-cdjbHvRyy7AtD_ewUw8hlj6ZYLszkN2vVJf4jWxXIBmn9O_uSTPjpmYAANVApBFrHqtiA/s16000-rw/20250509-0015%20Pegar%20los%20diccionarios%20en%20.config%20-%20VNote%20-%20Vnote%20-%20dicts.png)

Cierra VNote y vuevelo a abrir, queda iconizado, allí cierrelo con clic derecho y Quit:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg8-W0FhxbkJBf6httfFaVZEuP27AhIjX8LxmXmiusXcgdX8xNgh-D52ctuROMvt0TB12uk59th4qr_wOaznsz3mXrn6dVQ94balCeJ5-hurulwFz2hSZg5RmtE2r-rWQT3-pNRCTJ4__jzFyIcqy4oAxr_I6x5DcMMyz7bwovdwCkg0WTzwEjQ-FW2Qdc/s16000-rw/20250518-00016%20%20clic%20derecho%20al%20icono%20de%20VNote.png)



## Alternativamente puede crear accesos directos, pero es más difícil, es opcional

Puedes crear un enlace simbólico en lugar de copiar los diccionarios de `/usr/share/hunspell/` a `~/.config/VNote/VNote/dicts/` para evitar duplicar los archivos. Esto es seguro , ya que mantiene todo sincronizado: cuando se actualicen los diccionarios del sistema, VNote seguirá usando la versión más reciente. Funciona igual que si los archivos estuvieran copiados

**Pasos para crear el enlace simbólico:**

1. **Asegúrate de que el directorio de VNote para diccionarios exista:**

```bash
mkdir -p ~/.config/VNote/VNote/dicts
```

2. **Crea enlaces simbólicos para los diccionarios de español (`es_ANY.dic` y `es_ANY.aff` o similar):**

Los diccionarios en Debian normalmente se instalan como:
- `/usr/share/hunspell/es_ANY.dic`
- `/usr/share/hunspell/es_ANY.aff`

**Nota:** La palabra ANY equivale al nombre de algún diccionario que usted necesite

Puedes verificarlos con:

```bash
ls /usr/share/hunspell/es_*.dic /usr/share/hunspell/es_*.aff
```

a mi me sale:

```bash
wachin@debian12:~$ ls /usr/share/hunspell/es_*.dic /usr/share/hunspell/es_*.aff
/usr/share/hunspell/es_AR.aff  /usr/share/hunspell/es_EC.aff  /usr/share/hunspell/es_PE.aff
/usr/share/hunspell/es_AR.dic  /usr/share/hunspell/es_EC.dic  /usr/share/hunspell/es_PE.dic
/usr/share/hunspell/es_BO.aff  /usr/share/hunspell/es_ES.aff  /usr/share/hunspell/es_PR.aff
/usr/share/hunspell/es_BO.dic  /usr/share/hunspell/es_ES.dic  /usr/share/hunspell/es_PR.dic
/usr/share/hunspell/es_CL.aff  /usr/share/hunspell/es_GT.aff  /usr/share/hunspell/es_PY.aff
/usr/share/hunspell/es_CL.dic  /usr/share/hunspell/es_GT.dic  /usr/share/hunspell/es_PY.dic
/usr/share/hunspell/es_CO.aff  /usr/share/hunspell/es_HN.aff  /usr/share/hunspell/es_SV.aff
/usr/share/hunspell/es_CO.dic  /usr/share/hunspell/es_HN.dic  /usr/share/hunspell/es_SV.dic
/usr/share/hunspell/es_CR.aff  /usr/share/hunspell/es_MX.aff  /usr/share/hunspell/es_US.aff
/usr/share/hunspell/es_CR.dic  /usr/share/hunspell/es_MX.dic  /usr/share/hunspell/es_US.dic
/usr/share/hunspell/es_CU.aff  /usr/share/hunspell/es_NI.aff  /usr/share/hunspell/es_UY.aff
/usr/share/hunspell/es_CU.dic  /usr/share/hunspell/es_NI.dic  /usr/share/hunspell/es_UY.dic
/usr/share/hunspell/es_DO.aff  /usr/share/hunspell/es_PA.aff  /usr/share/hunspell/es_VE.aff
/usr/share/hunspell/es_DO.dic  /usr/share/hunspell/es_PA.dic  /usr/share/hunspell/es_VE.dic
```

Luego, crear los enlaces simbólicos, para el idioma o los idiomas que necesite, en mi caso quiero para el español Ecuador:

```bash
ln -s /usr/share/hunspell/es_EC.dic ~/.config/VNote/VNote/dicts/es_EC.dic
ln -s /usr/share/hunspell/es_EC.aff ~/.config/VNote/VNote/dicts/es_EC.aff
```


## Eligiendo los diccionarios a usar
Una vez que ya están instalados los diccionarios abra otra vez, de clic en el botón de editar:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhioTRfHLZVxMP8YpoV4R17qLAwtxPBYcXLi9FhYeV0MGqo4AyC_lfUwscT2qi7S7XmIASeg92FIlCnbMigUHFuwdVi0vsH2Zphw-48J8as5bFSkuQH5QLKEM3u9PDbxafSVYszZ2qcHe2cZLA00gyMat2F5uSGFQ5n74eTVfvYLa2f2xxJ3HmNqjEcijg/s16000-rw/20250518-00014%20la%20opci%C3%B3n%20Spelling%20de%20VNote%20s%C3%B3lo%20aparece%20estando%20en%20el%20modo%20edici%C3%B3n.png)

  
y en el programa en la esquina derecha abajo dice:

Spelling

y de clic en el diccionario que usted necesite:

![](https://blogger.googleusercontent.com/img/a/AVvXsEjyZmw5ybwpywEVRkGFe2JlU1J1FnnMSzAKNNbS50W3v64UKV5oyHmPZhMAUKo0MDU18FMoQd3EIAW088Gl9SFW4O0TvEr7qw6CxvKMYHxgYWYyS2ahG1F1_1743Zo1zGHWoJCHE3S98YtmEIRB__rk17YCqKoafbuoZ-g6ZSAXJCgoJhdwpuO11HF5ULY=s16000)

luego habilita la corrección ortográfica Spell Check:

![](https://blogger.googleusercontent.com/img/a/AVvXsEjyZmw5ybwpywEVRkGFe2JlU1J1FnnMSzAKNNbS50W3v64UKV5oyHmPZhMAUKo0MDU18FMoQd3EIAW088Gl9SFW4O0TvEr7qw6CxvKMYHxgYWYyS2ahG1F1_1743Zo1zGHWoJCHE3S98YtmEIRB__rk17YCqKoafbuoZ-g6ZSAXJCgoJhdwpuO11HF5ULY=s16000)


\frac{4}{4}\times 53

