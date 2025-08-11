Este Kernel \"Real Time\" yo lo uso para hacer música, vea:

**Cómo instalar y usar Jack Audio Connection Kit (JACK) + Ardour y sus
plugins con un Kernel de Tiempo Real en MX Linux 21 (basado en Debian
11)\
**<https://facilitarelsoftwarelibre.blogspot.com/2020/10/instalar-realtime-kernel-en-mx-linux.html>

\

### Requisitos de compilación

## 

::: {style="font-size: medium; font-weight: 400;"}
40 GB de espacio en Disco
:::

::: {style="font-size: medium; font-weight: 400;"}
 
:::

::: {style="font-size: medium; font-weight: 400;"}
#### Aplicación del las actualizaciones del sistema  {#aplicación-del-las-actualizaciones-del-sistema style="text-align: left;"}

<div>

Actualice los repositorios:

</div>

<div>

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
sudo apt update
```

</div>

<div>

 

</div>

<div>

Actualice los paquetes: 

</div>

<div>

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
sudo apt upgrade
```

</div>

### Instalando las dependencias

Instalar:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
sudo apt-get install gcc build-essential libncurses5-dev fakeroot wget xz-utils \
    flex bison libssl-dev autoconf automake cmake dwarves openssl libelf-dev \
    libudev-dev libpci-dev libiberty-dev bc python3-sphinx lzop lzma \
    lzma-dev libmpc-dev u-boot-tools gettext rsync libncurses-dev \
   libelf-dev libudev-dev pkg-config
```

<div>

\

</div>
:::

## Ver un Kernel antiguo pero actualizado

Necesito descargar un Kernel si tan antiguo ni tan nuevo\

**Longterm release kernels\
**<https://www.kernel.org/category/releases.html>

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh52VrC3U4xu-WY1OtMRGvc0cTn_72z4Liu868S0_WPWefwcpD1WUw4nGrpVGhrt5WmLFz_l72S5bq-DLDugSJybYrwhN5QdZVQa6Z7e9PjRPcHqrdM0_F98QolmAP_ecxFtEg0E-1YLwytH9sVk9917BW7-Ciyg_JAotgQD-z3X4twf9_74Yt-2FtxmXA/s16000/20240624-220435%20Kernel%205.10.png){border="0"
original-height="358"
original-width="920"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh52VrC3U4xu-WY1OtMRGvc0cTn_72z4Liu868S0_WPWefwcpD1WUw4nGrpVGhrt5WmLFz_l72S5bq-DLDugSJybYrwhN5QdZVQa6Z7e9PjRPcHqrdM0_F98QolmAP_ecxFtEg0E-1YLwytH9sVk9917BW7-Ciyg_JAotgQD-z3X4twf9_74Yt-2FtxmXA/s920/20240624-220435%20Kernel%205.10.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}\
\

**Nota:** Estos pasos usted los puede modificar para compilar otra
versión de Kernel.

### Por qué descargar un Kernel algo antiguo para compilarlo?

1.  Porque puede que tengan un ordenador antiguo  y quiera que rinda
    mejor, ejemplo tengo un ordenador que fue comprado en el año 2008 y
    quiero usar MX Linux 23 a esta fecha que hago este tutorial Junio
    del 2024, entonces necesito un Kernel lo más antiguo que se pueda
    instalar en este MX Linux 23 porque debe saber usted que un Kernel
    lo que tiene de importante es que funcionen el hardware de su
    ordenador y que sea seguro (esté actualizado). **Nota:** Los Kernel
    tienen una fecha en que ya no se les dará más soporte, pero viejo no
    quiere decir que no sirva sino que no estará actualizado para alguna
    vulnerabilidad que se pueda encontrar en el futuro.
2.  Si alguna vez tenga usted algún hardware que solo funcione con una
    versión vieja de Kernel Linux, deberá buscar un Linux antiguo que
    funcione aunque ya no le den actualizaciones pero que se pueda usar
    y descargar sus paquetes y allí compilar un Kernel viejo que se
    pueda compilar allí, para que aquel hardware viejo funcione, aunque
    no tenga mucha seguridad ese Kernel, pero yo lo veo de esta forma,
    mientras una persona no navegue en paginas malas estará seguro así
    sea que use un Kernel sin las ultimas actualizaciones (recomiendo en
    ese caso  cuando se termine el soporte es posible que yo lo siga
    usando y usaré: <https://www.mywot.com/download> u otro semejante)
    ademas que no hay que andar instalando cosas que no estemos seguros
    que sean seguras o no.
3.  Otra razón de compilar este Kernel, es porque a veces podría pasar
    (ha pasado, una vez enviaron uno así en las actualizaciones) que no
    compilan bien el Kernel y no funciona bien, entonces lo mejor es uno
    mismo compilarlo.

### ¿Consideraciones a tener en cuenta? {#consideraciones-a-tener-en-cuenta style="text-align: left;"}

Es posible que los deb del Kernel generado luego después de un tiempo no
funcionen en la misma máquina o en otra, esto debido a que con el paso
del tiempo pueden hacer algún cambio grande en el sistema y el Kernel de
la manera que fue creado puede que no encaje en esas modificaciones de
los paquetes que luego se instalaron por las actualizaciones que
enviaron, por lo que deberá buscar en kernel.org algún otro Kernel más
actual que si coincida con todo el entorno de su Linux. O sea, si usted
compila un Kernel, debe estar usted a la vanguardia, debe compilarlo con
alguna frecuencia, es como si usted fuera los que mantienen el sistema
que en algún momento envian algún Kernel nuevo, y de usted depende
verificar que todo funcione bien con el kernel.

### Antes del descargar el Kernel primero buscar un parche Real Time

Primero es necesario saber si existe el parche pues sino de nada servirá
descargar el Kernel. Me voy a buscar y descargar un parche \"Real Time\"
desde:

<https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/>

debo saber si hay uno 5.10:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgZbkbEmt58NDFXe49AfvCxjZCLD2ad8jJ4fjcpVJeNoswS7RAiXWLa0HgD7ePN6wQVqddEhtx5Bpol9bR3nKygGFTFS_V7ztidleMFe9nJF1b9cceUZlpDpzwINhTqNeP-Ixl8GTZsFPq8zKn3kh6QmgIazx3DXJL3VpRVmFLitygrKU_WWV2ewkQr1mI/s16000/20240624-221437%20parche%205.10.png){border="0"
original-height="344"
original-width="625"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgZbkbEmt58NDFXe49AfvCxjZCLD2ad8jJ4fjcpVJeNoswS7RAiXWLa0HgD7ePN6wQVqddEhtx5Bpol9bR3nKygGFTFS_V7ztidleMFe9nJF1b9cceUZlpDpzwINhTqNeP-Ixl8GTZsFPq8zKn3kh6QmgIazx3DXJL3VpRVmFLitygrKU_WWV2ewkQr1mI/s625/20240624-221437%20parche%205.10.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}\
\

Si usted es curioso y desea saber cómo obtuve este enlace pues es desde:

<https://www.kernel.org/>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgfsPXnnnoIbVGBKQbUnSLtEZmeuwM5UPMvUtrH_Ji2ve3U5wkp_Pbd7Og23N7JozXapO1MvfRu7f8Id2lyEpV0Amtx5rLGtspXzYfuG4tuFS3ZRYx70lJKltEl5pGj13cuSNU3THsqffnR1y3nxUaQdxpNGucgfJQ3V92e3o84XKqiEtyqhIHmD0IxQxY/s16000/20240503-045223%20kernel.org%20pub.png){border="0"
original-height="416"
original-width="909"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgfsPXnnnoIbVGBKQbUnSLtEZmeuwM5UPMvUtrH_Ji2ve3U5wkp_Pbd7Og23N7JozXapO1MvfRu7f8Id2lyEpV0Amtx5rLGtspXzYfuG4tuFS3ZRYx70lJKltEl5pGj13cuSNU3THsqffnR1y3nxUaQdxpNGucgfJQ3V92e3o84XKqiEtyqhIHmD0IxQxY/s909/20240503-045223%20kernel.org%20pub.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

ese link es este:

<https://www.kernel.org/pub/>

pero al dar clic ese enlace se convierte en:

<https://mirrors.edge.kernel.org/pub/>

y allí clic a:

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8Rnxn-lrd1ixjpG2HnpWx-cY-uoqg4EY3WO7FvzmbQMhwgsmP7LkeCMezbRHtnF5KKjcC_wA8ZBO975IraZ0jbQm-YORSUhFHcar7eieogZCVBDWGF4Jpzkd1bSPQzY5EdM_Mr95pSPaGIr1CERjObMLhSmnOlcxLIt7acJWk_uLVX720Ltxw4KlDO5I/s16000/20240503-045342%20enlace%20a%20kernel%20linux.png){border="0"
original-height="317"
original-width="620"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8Rnxn-lrd1ixjpG2HnpWx-cY-uoqg4EY3WO7FvzmbQMhwgsmP7LkeCMezbRHtnF5KKjcC_wA8ZBO975IraZ0jbQm-YORSUhFHcar7eieogZCVBDWGF4Jpzkd1bSPQzY5EdM_Mr95pSPaGIr1CERjObMLhSmnOlcxLIt7acJWk_uLVX720Ltxw4KlDO5I/s620/20240503-045342%20enlace%20a%20kernel%20linux.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

y allí clic a Kernel:

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8DMIjfj67dq3jeyORceV5w8Xq6Rg62C189aAYNbxZOeoa_tquSFPCvnusfoTsPWCV2U8tz0zVup1ieDnHgRAZNFj6ZWJLOHOdX2aEMy7wZ0MSzWKW_QIOtJ-o7X2jqUiVP1q65nuFgbjb0kQ4AFjMe7BCXpnrJXmG8RbYc3ygctDCkL33fWDwWhKa4OA/s16000/20240503-045709%20clic%20al%20kernel%20linux.png){border="0"
original-height="352"
original-width="553"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8DMIjfj67dq3jeyORceV5w8Xq6Rg62C189aAYNbxZOeoa_tquSFPCvnusfoTsPWCV2U8tz0zVup1ieDnHgRAZNFj6ZWJLOHOdX2aEMy7wZ0MSzWKW_QIOtJ-o7X2jqUiVP1q65nuFgbjb0kQ4AFjMe7BCXpnrJXmG8RbYc3ygctDCkL33fWDwWhKa4OA/s553/20240503-045709%20clic%20al%20kernel%20linux.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

y allí clic a projects:

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2DabXo0PEXbl3sznArSpQ669QtPmECDOBYWpGK4akBrYkwtiHQ1EtR_0lCSUsOvTsriBACQlcbDWSa9fuB4AD0pQeh6d9DH0dk9SqLTXdRnXK5WqWfLwd1LGO2Vrg1qknlmMRnxr4HMaWuvJ4FLIoGgxO5MTT6KoYi0kZFpjhdGTI7wqkZydu5NxrJx8/s16000/20240503-045954%20clic%20a%20projects.png){border="0"
original-height="585"
original-width="621"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2DabXo0PEXbl3sznArSpQ669QtPmECDOBYWpGK4akBrYkwtiHQ1EtR_0lCSUsOvTsriBACQlcbDWSa9fuB4AD0pQeh6d9DH0dk9SqLTXdRnXK5WqWfLwd1LGO2Vrg1qknlmMRnxr4HMaWuvJ4FLIoGgxO5MTT6KoYi0kZFpjhdGTI7wqkZydu5NxrJx8/s621/20240503-045954%20clic%20a%20projects.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

y allí clic a rt (Real Time):

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhNd5cnNqFx0k944x2oChMmT48N6ga7xBa9OUQW9v_pBzcrjpHnxWUCpcmFTm7XnELVFcnefoSwWT_qUVs8ZQxt_o9iB1Y2M-KzOP8BecLIORNfAtrS_ksViKCHnDG7utdRoa_0KKC3ZRDh5XmL5hUB-iZ2sckW1DH-DQSMYqat69pVtVOsJ9JkN_jVEMc/s16000/20240503-050057%20clic%20a%20rt.png){border="0"
original-height="272"
original-width="559"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhNd5cnNqFx0k944x2oChMmT48N6ga7xBa9OUQW9v_pBzcrjpHnxWUCpcmFTm7XnELVFcnefoSwWT_qUVs8ZQxt_o9iB1Y2M-KzOP8BecLIORNfAtrS_ksViKCHnDG7utdRoa_0KKC3ZRDh5XmL5hUB-iZ2sckW1DH-DQSMYqat69pVtVOsJ9JkN_jVEMc/s559/20240503-050057%20clic%20a%20rt.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

y clic a la versión

5.10

y veo que si  hay uno y entro allí:

<https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.10/>

<div>

\

</div>

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjv6YfSnolX-zvbVqcci00co9x5gxJl5c2s-h3P076d7A0Ygh0qjr6KjJXJWsTN0PqEFSLF31ogDA0ICUDqZB1D1CIfRzqeSnYRQy_hE8Uazr_9jScxeaqBLxHLUo89ztCIlTp5I0VbqHf5Xn0mfKW20IFiArO_EUIqzCbmf0GJM-1iz1IYs5p0rE3YIZU/s16000/20240624-221924%20Si%20hay%20parche%20Real%20Time%20para%20Kernel%205.10.png){border="0"
original-height="345"
original-width="620"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjv6YfSnolX-zvbVqcci00co9x5gxJl5c2s-h3P076d7A0Ygh0qjr6KjJXJWsTN0PqEFSLF31ogDA0ICUDqZB1D1CIfRzqeSnYRQy_hE8Uazr_9jScxeaqBLxHLUo89ztCIlTp5I0VbqHf5Xn0mfKW20IFiArO_EUIqzCbmf0GJM-1iz1IYs5p0rE3YIZU/s620/20240624-221924%20Si%20hay%20parche%20Real%20Time%20para%20Kernel%205.10.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}\

**Nota:** En el repositorio de parches RT para Linux, el archivo
**`patch`** contiene **todos los cambios en un único parche**, ideal
para aplicar rápidamente y compilar el kernel con soporte *real-time*.
En cambio, **`patches`** es un paquete con **varios parches
individuales**, útil si se quiere revisar o aplicar cambios de forma
selectiva. Para una compilación estándar, lo más práctico es usar el
`patch` único.

y copio el enlace del parche:

<https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.10/patch-5.10.218-rt110.patch.xz>\

**Nota: **Este enlace con el paso del tiempo es muy posible que ya no
esté porque o lo habrán actualizado o habrá salido del soporte.

Entonces como sé que existe el parche Real Time, entonces ahora si busco
el Kernel correspondiente, pues es obvio que si hay un parche para ese
Kernel entonces habrá el Kernel (por eso no hago la busqueda de primero
el Kernel y luego del parque, porque es posible que el parche no haya
para alguna versión de Kernel entonces por gusto perdería el tiempo)

### Buscando el Kernel 5.10

Como ya tengo el enlace del Kernel, entro en:

<https://mirrors.edge.kernel.org/pub/linux/kernel/>

busco allí uno 5x

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqYm8kAECYMPoxFSImkJ2YfRPCBd2oyWhkpjCIkXkxZNeb90hV3z3iTDMS1KhHqRlhO4nsPo702mS9yHhd3lSaqnH3lJ1amkNcjNmcnntggeHj9kkaJame4GRmvVBqYKBBeiiHPK3oNICSpyS7uzqPxgaVgkh6PMvk-lfDbkufz2GLk7ZR87_Dc0X1XXw/s16000/20240624-222141%20Kernel%205x.png){border="0"
original-height="640"
original-width="617"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjqYm8kAECYMPoxFSImkJ2YfRPCBd2oyWhkpjCIkXkxZNeb90hV3z3iTDMS1KhHqRlhO4nsPo702mS9yHhd3lSaqnH3lJ1amkNcjNmcnntggeHj9kkaJame4GRmvVBqYKBBeiiHPK3oNICSpyS7uzqPxgaVgkh6PMvk-lfDbkufz2GLk7ZR87_Dc0X1XXw/s640/20240624-222141%20Kernel%205x.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

y voy a buscar el Kernel con las siguientes palabras:

linux-5.10.

con 

Crtl + F

buscaré el más actual:

\
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEji7SIjUxwE9vfsXo1CpMvg7OsbgEUtlXebSrqegD8UJihgB_lf6DEVshLqYG1rmfGiKVCvBQ8hyvvT9sM3LM-U0SZQZZGwv6SizCGmUKGcXC8qCOeqxzkNtgR-bQG_xsRcUCqrgQ6ioZXjXoMpXGXp7ZHnlr9rWNOwurwa2CVcPFQLQYk9b4cxJQXmpV4/s16000/20240624-222406%20el%20m%C3%A1s%20actual%20es%20ese.png){border="0"
original-height="724"
original-width="672"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEji7SIjUxwE9vfsXo1CpMvg7OsbgEUtlXebSrqegD8UJihgB_lf6DEVshLqYG1rmfGiKVCvBQ8hyvvT9sM3LM-U0SZQZZGwv6SizCGmUKGcXC8qCOeqxzkNtgR-bQG_xsRcUCqrgQ6ioZXjXoMpXGXp7ZHnlr9rWNOwurwa2CVcPFQLQYk9b4cxJQXmpV4/s724/20240624-222406%20el%20m%C3%A1s%20actual%20es%20ese.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}

y copio aquí el nombre y la descripción:

linux-5.10.220.tar.xz                              21-Jun-2024 13:03   
115M

**Nota:** la versión 220 es la más actualizada con la fecha 24 de junio
2024 entonces esa la utilizaré, copio el enlace:

<https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.10.220.tar.xz>\

\

### DESCARGA DE AMBOS (Opcional) 

Sea como sea que descarguen los archivos recomiendo que los tengan
dentro de una carpeta para este caso con algun nombre que la
identifique, en mi caso yo lo hago en la ruta que he
creado: /home/wachin/Dev/kernel5.10/, allí dentro pongo en la terminal:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.10/patch-5.10.218-rt110.patch.xz
wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.10.220.tar.xz
```

<div>

\

</div>

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiz39qlv43eEhW-GBcVWqMYQWLh6LvElIfFoq-0MPofyfN5zU83RBkdtRI-uKSPfZraTzp86CzTc2flrTOJ9ScwBU2cTFMCqq-7F1Lzal1NkgLzp7gyyofZx87zjRqv5jumy43GyGpxPXn8eDxyFbMws8iHYd0oE9dnPWQQJCEERGRTOi26p6MY-uM0GK4/s16000/20240624-232621%20donde%20tengo%20el%20kernel%205.10.png){border="0"
original-height="500"
original-width="904"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiz39qlv43eEhW-GBcVWqMYQWLh6LvElIfFoq-0MPofyfN5zU83RBkdtRI-uKSPfZraTzp86CzTc2flrTOJ9ScwBU2cTFMCqq-7F1Lzal1NkgLzp7gyyofZx87zjRqv5jumy43GyGpxPXn8eDxyFbMws8iHYd0oE9dnPWQQJCEERGRTOi26p6MY-uM0GK4/s904/20240624-232621%20donde%20tengo%20el%20kernel%205.10.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}

\

### Extracción y parchado del Kernel

Se puede descomprimir el Kernel con clic derecho y extraer aquí:

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEhUOAjXGwh1fBXAUNzo9W_RX-hDbGnKR__nKh6vBP7buaA_qko53u4jWGWdy85_dTkRJS4ZIfTy2JBpg-Nip420DYR8TX7H-NFoacRxlmPMGDXgmu1fK-sxuz3aKes4qxdxS0Voc54Z5Mganov5MhkwT9muajX65AKoyiRw_Yk-FzrhVaRB5iilbjQuZyI=s16000){original-height="571"
original-width="889"}](https://blogger.googleusercontent.com/img/a/AVvXsEhUOAjXGwh1fBXAUNzo9W_RX-hDbGnKR__nKh6vBP7buaA_qko53u4jWGWdy85_dTkRJS4ZIfTy2JBpg-Nip420DYR8TX7H-NFoacRxlmPMGDXgmu1fK-sxuz3aKes4qxdxS0Voc54Z5Mganov5MhkwT9muajX65AKoyiRw_Yk-FzrhVaRB5iilbjQuZyI){style="margin-left: 1em; margin-right: 1em;"}
:::

\
\

o también desde la terminal con:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
tar xJvf linux-5.10.220.tar.xz
```

como sea que usted descomprima el archivo debe que darle así:

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgVR0YljqUxQ7AJsBWBnNmD9N-CiQYrieDsWeZzSj_fRhv6Z1BvbRSPl6sGGisLqXOMAeCu4tJ9D3zCs16lN-kCwpauiDOQEg5dor46AV1nj6-2biu34rTZBCWcrSziz2FxrY_hCPcWwOsQLv5wl52c02jZ740p-Y9-qUaaIaCrTPVsiv-VL8HV7owz2Sg=s16000){original-height="498"
original-width="738"}](https://blogger.googleusercontent.com/img/a/AVvXsEgVR0YljqUxQ7AJsBWBnNmD9N-CiQYrieDsWeZzSj_fRhv6Z1BvbRSPl6sGGisLqXOMAeCu4tJ9D3zCs16lN-kCwpauiDOQEg5dor46AV1nj6-2biu34rTZBCWcrSziz2FxrY_hCPcWwOsQLv5wl52c02jZ740p-Y9-qUaaIaCrTPVsiv-VL8HV7owz2Sg){style="margin-left: 1em; margin-right: 1em;"}
:::

debo entrar allí en una terminal con:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
cd linux-5.10.220
```

si lo descomprimió desde la terminal y con clic derecho abrir terminal
aquí, como sea que lo haya hecho hay que poner lo siguiente:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
xzcat ../patch-5.10.218-rt110.patch.xz | patch -p1
```

<div>

[``]{style="font-size: medium;"}

</div>

<div>

[`Nota: Este comando usted para otro kernel lo debe de editar (cambiar toda la ruta hasta la extensión del nombre del parche)`]{style="font-size: medium;"}

</div>

<div>

[``]{style="font-size: medium;"}

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgpUxRQrD5skGCHgF7W_jU3RcfS2WVlnTyuZqDvTt_spKRKVrgKQZjw8pyOnmNsRAvRlfLGkLtyAwMUIXDWpIvKt3keijUzdxPN5lGVWECpcA2dC_kEnA0pXPqOGMDfOBup5PGrVumuanqB0ozuAAaeyZl8aT06Ma9mwaeuwwsT9kXN5ByItAVPtc6qek4=s16000){original-height="611"
original-width="999"}](https://blogger.googleusercontent.com/img/a/AVvXsEgpUxRQrD5skGCHgF7W_jU3RcfS2WVlnTyuZqDvTt_spKRKVrgKQZjw8pyOnmNsRAvRlfLGkLtyAwMUIXDWpIvKt3keijUzdxPN5lGVWECpcA2dC_kEnA0pXPqOGMDfOBup5PGrVumuanqB0ozuAAaeyZl8aT06Ma9mwaeuwwsT9kXN5ByItAVPtc6qek4){style="margin-left: 1em; margin-right: 1em;"}
:::

\
\

De Enter y se parchará

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEg3stmD9WGqlX3nsYUlIjI7c8swF7pmbYwWTunAn0X5QP5HxI7qRPcCAKQ27xha9MIzNGEkcqKAkAoxLHoYvtqc64PgiLwTUjruBWscPe3gd2CL13zpeIkHbs1jh5hudhc1uA0xN5IRbuE7768ce6LnbGE4USE7U6cXby-DPv-csQb5TfqkD3bL__dqmUI=s16000){original-height="606"
original-width="998"}](https://blogger.googleusercontent.com/img/a/AVvXsEg3stmD9WGqlX3nsYUlIjI7c8swF7pmbYwWTunAn0X5QP5HxI7qRPcCAKQ27xha9MIzNGEkcqKAkAoxLHoYvtqc64PgiLwTUjruBWscPe3gd2CL13zpeIkHbs1jh5hudhc1uA0xN5IRbuE7768ce6LnbGE4USE7U6cXby-DPv-csQb5TfqkD3bL__dqmUI){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

### Añadir el nombre del Mantenedor o Responsable a su Sistema para que se compile con ese nombre (Opcional)

Esto es totalmente opcional, no es necesario para compilar el Kernel

Para hacer esto ponga en una terminal lo siguiente (teniendo instalado
Gedit u otro editor pero debe cambiar el nombre en la terminal):

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
gedit ~/.bashrc 
```

<div>

\

</div>

allí debe llegar hasta abajo y con enter hacerse un espacio::

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEjyxEkHtC6FSeAlqfV2KXKI7Ni5nBvtiejsMpYKzDSMmrI4Y5aOlBpg3ugbrYZiRClOyQ_H7JMG8v0BhLnRReShE41vqAkGfZrwUzK2LInVfrqNKeLAFacBXzUh1HThfoel9-sWfNimBDGH5Z3SMQ78okzwNrpiFSf9wasoIX9L1kpWKWpLzidERUeU=s16000){original-height="593"
original-width="757"}](https://blogger.googleusercontent.com/img/a/AVvXsEjyxEkHtC6FSeAlqfV2KXKI7Ni5nBvtiejsMpYKzDSMmrI4Y5aOlBpg3ugbrYZiRClOyQ_H7JMG8v0BhLnRReShE41vqAkGfZrwUzK2LInVfrqNKeLAFacBXzUh1HThfoel9-sWfNimBDGH5Z3SMQ78okzwNrpiFSf9wasoIX9L1kpWKWpLzidERUeU){style="margin-left: 1em; margin-right: 1em;"}
:::

\
 y allí debe de poner lo siguiente:

DEBEMAIL=\"your.email.address@example.org\"\
DEBFULLNAME=\"Firstname Lastname\"\
export DEBEMAIL DEBFULLNAME

y cambiar con sus datos, a mi me queda así:\

::: {.separator style="clear: both; text-align: center;"}
::: {.separator style="clear: both;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEiYcoO48RbNiVNv75ejUow3IkQhbUAWP5k0exROfZ1UlYHZCD0_yocp5HigNJcWrZnWLf_etsKS2MLlck7stoAjzAMi7nl127bL0Q-wgFS3E_y5-a_RPMeRNgdQ_LWzvRlZXtRMAuls_U1GXG8k21OcwMjMG7Ggfcea7QhszAre6qnFUmqfX7UZf96f=s16000){original-height="574"
original-width="706"}](https://blogger.googleusercontent.com/img/a/AVvXsEiYcoO48RbNiVNv75ejUow3IkQhbUAWP5k0exROfZ1UlYHZCD0_yocp5HigNJcWrZnWLf_etsKS2MLlck7stoAjzAMi7nl127bL0Q-wgFS3E_y5-a_RPMeRNgdQ_LWzvRlZXtRMAuls_U1GXG8k21OcwMjMG7Ggfcea7QhszAre6qnFUmqfX7UZf96f){style="margin-left: 1em; margin-right: 1em;"}
:::

 
:::

::: {.separator style="clear: both; text-align: center;"}
\
:::

ahora cierro el editor de texto y:

</div>

<div>

 

</div>

<div>

**Salir (cerrar) sesión**

</div>

<div>

 

</div>

<div>

y vuelvo a entrar. Para confirmar sus datos ponga en una terminal:

</div>

<div>

\

</div>

<div>

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
echo $DEBEMAIL
echo $DEBFULLNAME
```

</div>

<div>

 y le deben salir sus datos. Con esto una vez instalado el Kernel al
revisarlo en Synaptic se verá allí su nombre y su correo en los
paquetes.

</div>

<div>

\

</div>

### Antes de continuar haga grande el tamaño de la terminal {#antes-de-continuar-haga-grande-el-tamaño-de-la-terminal style="text-align: left;"}

<div>

Sino hace más grande el tamaño de la terminal se saldrá el error:

</div>

<div>

\

</div>

<div>

HOSTLD  scripts/kconfig/mconf\
\#\
\# using defaults found in /boot/config-6.1.0-37-686-pae\
\#\
/boot/config-6.1.0-37-686-pae:5594:warning: symbol value \'m\' invalid
for RADIO_ADAPTERS\
/boot/config-6.1.0-37-686-pae:6216:warning: symbol value \'m\' invalid
for DRM_GEM_SHMEM_HELPER\
/boot/config-6.1.0-37-686-pae:6860:warning: symbol value \'m\' invalid
for SND_SOC_SOF_DEBUG_PROBES\
/boot/config-6.1.0-37-686-pae:6897:warning: symbol value \'m\' invalid
for SND_SOC_SOF_HDA_PROBES\
Your display is too small to run Menuconfig!\
It must be at least 19 lines by 80 columns.\
make\[1\]: \*\*\* \[scripts/kconfig/Makefile:29: menuconfig\] Error 1\
make: \*\*\* \[Makefile:614: menuconfig\] Error 2\

</div>

<div>

\

</div>

<div>

este error significa:\

### **Error principal:**

<div>

::: {.my-[12px] .code-cntainer .code-cntainer-mobile dir="ltr"}
::: {.text-text-300 .absolute .pl-4 .text-xs .font-medium .dark:text-white .code-cntainer-mobile-title}
:::

::: {.copy .top-8 .z-10 .flex .items-center .justify-end .py-1 .pr-2.5 .text-xs .text-black .dark:text-white}
::: {.flex .translate-y-[1px] .items-center .gap-0.5}
::: {.flex aria-label="Copiar"}
:::
:::
:::
:::

</div>

::: {.flex aria-label="Descargar"}
:::

<div>

::: {.my-[12px] .code-cntainer .code-cntainer-mobile dir="ltr"}
::: {.language- .-mt-8 .rounded-t-xl .rounded-b-xl .overflow-hidden .code-content}
::: {.code-block-header .code-header}
:::

::: {#code-textarea-d3c97685-c203-4949-b9a5-ead8a66b4684-5 .code-textarea .h-full .w-full}
::: {.cm-editor .ͼ1 .ͼ2 .ͼ4}
::: {.cm-announced aria-live="polite"}
:::

::: {.cm-scroller tabindex="-1"}
::: {.cm-gutters .cm-gutters-before aria-hidden="true" style="min-height: 47.2px; position: sticky;"}
::: {.cm-gutter .cm-lineNumbers}
::: {.cm-gutterElement style="height: 0px; pointer-events: none; visibility: hidden;"}
:::

Your display is too small to run Menuconfig!\
It must be at least 19 lines by 80 columns.
:::
:::

::: {.cm-layer .cm-layer-above .cm-cursorLayer aria-hidden="true" style="animation-duration: 1200ms; z-index: 150;"}
:::

::: {.cm-layer .cm-selectionLayer aria-hidden="true" style="z-index: -2;"}
:::
:::
:::
:::
:::

::: {#plt-canvas-d3c97685-c203-4949-b9a5-ead8a66b4684-5 .scrollbar-hidden .max-w-full .overflow-x-auto .bg-[#202123] .text-white}
:::
:::

</div>

::: my-2
:::

Esto es **claro y directo**: tu terminal no tiene suficientes filas
(líneas) o columnas para que `menuconfig`{.codespan .cursor-pointer
.z-[9] .relative} pueda mostrarse correctamente. Para solucionarlo
siemplemente Aumenta el tamaño de tu terminal, y luego allí si\

</div>

poner:

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
make menuconfig
```

<div>

\

</div>

<div>

[]{style="font-size: medium;"}

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEh46qKhKChdfuEB1o2HH8WYSMeZGriBNxmfmzRlJ6U1hTIiPFr-ZnRmy_EdDZE2IZ-Ry6s6oFt-iax4JjNRfKqBNLfzy5NMVBn-a6N-JxuL6YzqYHb7kvgjHCnvUFNg6vICjqjNfY74yoVJZ5Ar0AFtGqpC4QINIjjXPiASZPVVGQroE89D9b42AyiJcKA=s16000){original-height="499"
original-width="901"}](https://blogger.googleusercontent.com/img/a/AVvXsEh46qKhKChdfuEB1o2HH8WYSMeZGriBNxmfmzRlJ6U1hTIiPFr-ZnRmy_EdDZE2IZ-Ry6s6oFt-iax4JjNRfKqBNLfzy5NMVBn-a6N-JxuL6YzqYHb7kvgjHCnvUFNg6vICjqjNfY74yoVJZ5Ar0AFtGqpC4QINIjjXPiASZPVVGQroE89D9b42AyiJcKA){style="margin-left: 1em; margin-right: 1em;"}
:::

\
\
`y aparecerá el menú:`

</div>

<div>

[``]{style="font-size: medium;"}

</div>

<div>

[``]{style="font-size: medium;"}

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgldqWzM8_iu92K7vxsGZoLAj_uYA-PGfofGSobXUyzwQAoy37uShZk2CdOJ-uLBvgkkzTPqeeN721AKlBcPzpCjmQPE8dKElBWS1utG6w4z8iPvIv3OUHxOh7dWI_LJbwfmoSuYfWjmvVT7dt3lB3dolCTjx9DPezXZSCtNfC5UJnV_KSDLpauLbVqBKQ=s16000){original-height="503"
original-width="903"}](https://blogger.googleusercontent.com/img/a/AVvXsEgldqWzM8_iu92K7vxsGZoLAj_uYA-PGfofGSobXUyzwQAoy37uShZk2CdOJ-uLBvgkkzTPqeeN721AKlBcPzpCjmQPE8dKElBWS1utG6w4z8iPvIv3OUHxOh7dWI_LJbwfmoSuYfWjmvVT7dt3lB3dolCTjx9DPezXZSCtNfC5UJnV_KSDLpauLbVqBKQ){style="margin-left: 1em; margin-right: 1em;"}
:::

\
**Nota:** En la imagen de arriba ya hice la ventana más grade, pero si
tiene un ordenador con una buena pantalla hagala más grande de alto.\
\

**Explicación de la ayuda.- **Allí dice en inglés:

> Arrow keys navigate the menu.  \<Enter\> selects submenus \-\--\> (or
> empty submenus \-\-\--). \
> Highlighted letters are hotkeys.  Pressing \<Y\> includes, \<N\>
> excludes, \<M\> modularizes features.\
> Press \<Esc\>\<Esc\> to exit, \<?\> for Help, \</\> for Search. 
> Legend: \[\*\] built-in  \[ \] excluded\
> \<M\> module  \< \> module capable

Cuya traducción **significa**:

> Las teclas de flecha se usan para navegar por el menú. \<Enter\>
> selecciona submenús \-\--\> (o submenús vacíos \-\-\--).\
> Las letras resaltadas son teclas de acceso rápido. Presionar \<Y\>
> incluye, \<N\> excluye, \<M\> modulariza características.\
> Presione \<Esc\>\<Esc\> para salir, \<?\> para Ayuda, \</\> para
> Buscar. Leyenda: \[\*\] incorporado \[ \] excluido\
> \<M\> módulo \< \> compatible con módulo

** Explicación:**

### **1. Navegación por el menú**

La herramienta `menuconfig` presenta una interfaz basada en texto para
configurar las opciones del kernel. Aquí están las instrucciones clave
sobre cómo navegar:

-   **Teclas de flecha**:\
    Usa las teclas de flecha **arriba** y **abajo** para moverte por las
    opciones del menú.\
    Usa las teclas de flecha **izquierda** y **derecha** para moverte
    entre acciones (como \"Salir\" o \"Guardar\").

-   **\<Enter\>**:\
    Presionar la tecla `Enter` en una opción:

    -   Si es un **submenú**, te lleva a un nivel más profundo del menú
        para configurar opciones relacionadas. Ejemplo: \"Controladores
        de red\".
    -   Si es una opción que no tiene submenú, puedes cambiar su estado
        (activado, desactivado o modular, dependiendo de lo que
        soporte). Tenga siempre mucho cuidado en cuantas veces da Enter\

### **2. Configuración de opciones**

Cada opción del kernel puede estar en uno de los siguientes estados:

-   **\<Y\>** (Yes, Sí):\
    La característica se **incluye directamente** en el kernel como
    parte del núcleo.\
    Representado como `[ * ]`.

-    **\<N\>** (No):\
    La característica se **excluye por completo** del kernel.\
    Representado como `[ ]`.

-    **\<M\>** (Module, Módulo):\
    La característica se compila como un **módulo externo** que puede
    cargarse o descargarse dinámicamente en el sistema.\
    Representado como `<M>`.

-   **\< \>** (Compatible con módulo):\
    Algunas opciones tienen el indicador `< >` para mostrar que pueden
    configurarse como módulos. Si seleccionas \"modular\", aparecerá
    `<M>`.

### **3. Accesos rápidos**

La interfaz tiene accesos rápidos para facilitar la configuración:

-   **Teclas resaltadas**:\
    Cada opción tiene letras resaltadas (normalmente en mayúsculas).
    Puedes presionar esa letra para seleccionar rápidamente esa opción.

-   **\<Esc\>\<Esc\>**:\
    Presiona `Esc` dos veces seguidas para salir del menú o de un
    submenú.

-   **\<?\>**:\
    Presiona `?` para ver información de ayuda sobre la opción que
    tengas seleccionada. Esto es útil si no sabes qué hace una
    característica o cómo afectará a tu sistema.

-   **\</\>**:\
    Presiona `/` para buscar una opción específica por nombre. Por
    ejemplo, si buscas \"EXT4\", puedes encontrar rápidamente las
    opciones relacionadas con este sistema de archivos.

### **4. Leyenda**

La leyenda explica los símbolos que ves en el menú y su significado:

-   `[ * ]`: La opción está habilitada e incluida como parte del kernel.
-   `[ ]`: La opción está deshabilitada y no estará en el kernel.
-   `<M>`: La opción está habilitada como un módulo y se compilará por
    separado.
-   `< >`: La opción es compatible con módulos, pero no está habilitada
    actualmente.

------------------------------------------------------------------------

### **Ejemplo práctico**

Supongamos que estás configurando el soporte para el sistema de archivos
**EXT4**:

1.  Busca \"EXT4\" presionando `/` y escribe \"ext4\".

2.  Verás las opciones relacionadas con EXT4. Puedes:

    -   Presionar `<Y>` para incluir el soporte directamente en el
        kernel (se cargará siempre).
    -   Presionar `<M>` para que se compile como módulo (puedes
        cargarlo/desactivarlo más tarde).
    -   Presionar `<N>` para excluirlo si no lo necesitas.

    **Nota:** Cuando cierres  menuconfig si algo salió mal en la
    terminal aparecerán unas informaciones, debes de leer o traducir
    para entender qué es lo que dice, pues allí dirá si alguna
    configuración de módulo, o si al caracteristica fue incluida
    directamente en el kernel no sea soportada (pero esto es en el caso
    de que alguien haga alguna configuración de ese tipo, bueno yo no
    hago esas configuraciones, pero por un caso algún error).\

### **Entonces**

`menuconfig` es una herramienta poderosa pero requiere cuidado. Recuerda
que incluir demasiadas cosas en el núcleo () puede hacerlo pesado,
mientras que usar módulos () te da más flexibilidad. Siempre lee la
ayuda (`?`) si no estás seguro de qué hace una opción.

###  **Consejos**  {#consejos style="text-align: left;"}

El consejo que les doy es que la tecla \"Espacio\" la usen con mucho
cuidado, no la presionen por gusto pues esa es para cambiar las
opciones, y usted podría sin querer cambiar algo del Kernel y luego no
sabría que cambió.

## CONFIGURAR EL TIEMPO REAL

<div>

Verificar las configuraciones Real Time según el tutorial:

</div>

<div>

**\
**

</div>

<div>

**\
**

</div>

<div>

Debe ver si están las siguientes marcadas para convertirlo en un Kernel
Real Time,[ **las siguientes son todas las instrucciones en texto, más
abajo están las mismas a las cuales les he puesto unas capturas de
pantalla**]{style="color: red;"} [**para que vean con imágenes**
]{style="color: red;"}:

</div>

<div>

::: {.code-toolbar style="-webkit-text-stroke-width: 0px; color: #222222; font-family: \"YaHei Consolas Hybrid\", \"Noto Sans\", \"Helvetica Neue\", \"Segoe UI\", Helvetica, Tahoma, Arial, Geneva, Georgia, Palatino, \"Times New Roman\", 冬青黑体, \"Microsoft YaHei\", 微软雅黑, \"Microsoft YaHei UI\", \"WenQuanYi Micro Hei\", 文泉驿雅黑, Dengxian, 等线体, STXihei, 华文细黑, \"Liberation Sans\", \"Droid Sans\", NSimSun, 新宋体, SimSun, 宋体, \"Apple Color Emoji\", \"Segoe UI Emoji\"; font-size: 16px; position: relative;"}
``` {.language-txt .line-numbers style="background: rgb(245, 242, 240); color: black; counter-reset: linenumber 0; font-size: 1em; hyphens: none; line-height: 1.5; margin-bottom: 0.5em; margin-top: 0.5em; overflow-wrap: normal; overflow: auto; padding: 1em 1em 1em 3.8em; position: relative; tab-size: 4; text-shadow: white 0px 1px; word-break: normal; word-spacing: normal;"}
# Enabled CCONFIG_NO_HZ_IDLE
 -> General setup
  -> Timers subsystem
   -> Timer tick handling (Full dynticks system (tickless))
    (X) Idle dynticks system (tickless idle)

# Enabled CONFIG_HIGH_RES_TIMERS
 -> General setup
  -> Timers subsystem
   [*] High Resolution Timer Support

# Enabled CONFIG_PREEMPT_RT
 -> General setup  -> Preemption Model (Fully Preemptible Kernel (Real-Time))
   (X) Fully Preemptible Kernel (Real-Time) (Nota:los nombres pueden variar por la versión del Kernel)  # Enabled CONFIG_HZ_1000 
 -> Processor type and features
  -> Timer frequency (1000 HZ)
   (X) 1000 HZ

# Enabled CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 ->  Power management and ACPI options
  -> CPU Frequency scaling
    -> Default CPUFreq governor
     (X) performance  #  Verificar el soporte para particiones exFAT, NTFS -> File systems  -> DOS/FAT/EXFAT/NT Filesystems
```
:::

 

</div>

<div>

</div>

<div>

Ahora si, de aquí para abajo para facilidad de entender qué es lo que se
hace les pongo unas capturas de pantalla (pero algunas capturas son de
otros de mis tutoriales, digo por un caso):

</div>

<div>

\

</div>

<div>

<div>

### \# Enabled CONFIG_HIGH_RES_TIMERS

<div>

**Temporizadores de alta resolución** son **esenciales** para garantizar
que las tareas de audio en tiempo real se gestionen correctamente, ya
que permiten una mayor precisión en la ejecución de procesos, es crucial
para lograr un sistema de audio de baja latencia:

</div>

<div>

 \

</div>

<div>

 -\> General setup

</div>

<div>

 

</div>

<div>

[![](https://blogger.googleusercontent.com/img/a/AVvXsEi93yDckV6ALDZzxbaENiThSypOrOCInLTW9k4WpJ7so--CONaBOldks7W9D2r0NsRzYxCJgh6K0F3IzymtoTI-X0EHBxBJVoatfXD0UUAHgUVsjmZkMRAYzXRpk6KeHImjYWUqoqZP5b-MqKMqYCdFhK7ycOj1_nstiYtu9Hxck_eGo7k1aDH9EW7K0NY=s16000){original-height="578"
original-width="965"}](https://blogger.googleusercontent.com/img/a/AVvXsEi93yDckV6ALDZzxbaENiThSypOrOCInLTW9k4WpJ7so--CONaBOldks7W9D2r0NsRzYxCJgh6K0F3IzymtoTI-X0EHBxBJVoatfXD0UUAHgUVsjmZkMRAYzXRpk6KeHImjYWUqoqZP5b-MqKMqYCdFhK7ycOj1_nstiYtu9Hxck_eGo7k1aDH9EW7K0NY){style="margin-left: 1em; margin-right: 1em;"}

</div>

<div>

  

</div>

<div>

-\> Timers subsystem

</div>

<div>

   \[\*\] High Resolution Timer Support

</div>

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEj3Y41omXxTC5vjABugnAT69dbFevnqr_B38dG_CCg3wDqC7ZUHIng_shy3SKILItJBJD0ls1-GWGbZTxapbTJU48cU27ZvXEifvCBobOcoAgyKe7FYQeQ07l6ZVNeYBfFx3FF1oYeopASivo-7Iv-sS8uIf6jplbCZitGb2U1CAxGDQrZskD006NyFNlw=s16000){original-height="581"
original-width="957"}](https://blogger.googleusercontent.com/img/a/AVvXsEj3Y41omXxTC5vjABugnAT69dbFevnqr_B38dG_CCg3wDqC7ZUHIng_shy3SKILItJBJD0ls1-GWGbZTxapbTJU48cU27ZvXEifvCBobOcoAgyKe7FYQeQ07l6ZVNeYBfFx3FF1oYeopASivo-7Iv-sS8uIf6jplbCZitGb2U1CAxGDQrZskD006NyFNlw){style="margin-left: 1em; margin-right: 1em;"}
:::

\

</div>

### \# Enabled CCONFIG_NO_HZ_IDLE

<div>

El **"sistema tickless"** ayuda a reducir las interrupciones cuando el
sistema está inactivo. Esto es útil para evitar que el kernel
desperdicie ciclos de CPU en tiempos de inactividad y, de este modo, se
mejora la latencia general. Dado que tu sistema se usará para producción
de audio, el sistema **tickless** es altamente recomendable:

</div>

<div>

 \

</div>

<div>

-\> General setup

</div>

<div>

</div>

<div>

</div>

<div>

      -\> Timers subsystem

</div>

<div>

\

</div>

<div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEiKVY7icwTw0v1J_T29XXxFQEgrRICa2oGixhkkW_YzZtYKASO5suk4QAIphQnnZF_MQD-0ttMrMsAzvByDLTvK11zTYbUsH7jPZbCc2WmadOjKfb2ltrcosCXAtPd8zKPaxKTrDjmfqeuLlApTGcYkusGroWDcm18hwZYDYMSYK8SjBiDTwaITxGA-Aq0=s16000){original-height="584"
original-width="956"}](https://blogger.googleusercontent.com/img/a/AVvXsEiKVY7icwTw0v1J_T29XXxFQEgrRICa2oGixhkkW_YzZtYKASO5suk4QAIphQnnZF_MQD-0ttMrMsAzvByDLTvK11zTYbUsH7jPZbCc2WmadOjKfb2ltrcosCXAtPd8zKPaxKTrDjmfqeuLlApTGcYkusGroWDcm18hwZYDYMSYK8SjBiDTwaITxGA-Aq0){style="margin-left: 1em; margin-right: 1em;"}
:::

</div>

<div>

\

</div>

<div>

y de Enter en:

</div>

<div>

\

</div>

<div>

   Timer tick handling (Idle dynticks system (tickless idle))  \-\--\> 

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgHwqh3fPJbiFu1t9Ay4o4Lb2-xQ2VhKEAIMdQE6_QIbu-8t2kcDWwrkH9CsQY8K_8r_Dp78jMjNx5_H106P5HEF3i_piGq2i17ifzoAm5XF3Aa9IqDzjPoRBftZYiiSzy2XL5xhkyf5cg_70sS5JN5csKtfxDgKcehFq5nItawsLV3ThlQpSIjKroTsRY=s16000){original-height="583"
original-width="959"}](https://blogger.googleusercontent.com/img/a/AVvXsEgHwqh3fPJbiFu1t9Ay4o4Lb2-xQ2VhKEAIMdQE6_QIbu-8t2kcDWwrkH9CsQY8K_8r_Dp78jMjNx5_H106P5HEF3i_piGq2i17ifzoAm5XF3Aa9IqDzjPoRBftZYiiSzy2XL5xhkyf5cg_70sS5JN5csKtfxDgKcehFq5nItawsLV3ThlQpSIjKroTsRY){style="margin-left: 1em; margin-right: 1em;"}
:::

\
aparece así:

<div>

\

</div>

<div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgPIUdQweUbqQJZ8cBGH5Hty-UhTeMqUeqmCxdxJKmXJE_m3h5aQ9EcKuefrxTz9r0mRkkNYpDf9hLImmfsZWJfGzzTej1sJa7WsWAIuFxwN3RElRc2i_FvjnjvHfmLRuqBGCzahoGli7MB63KQcni0q0a2fIz7YpLgiu-ZyUG1AkYrNdAMTRMsl6aUFbk=s16000){original-height="585"
original-width="963"}](https://blogger.googleusercontent.com/img/a/AVvXsEgPIUdQweUbqQJZ8cBGH5Hty-UhTeMqUeqmCxdxJKmXJE_m3h5aQ9EcKuefrxTz9r0mRkkNYpDf9hLImmfsZWJfGzzTej1sJa7WsWAIuFxwN3RElRc2i_FvjnjvHfmLRuqBGCzahoGli7MB63KQcni0q0a2fIz7YpLgiu-ZyUG1AkYrNdAMTRMsl6aUFbk){style="margin-left: 1em; margin-right: 1em;"}
:::

</div>

<div>

\

<div>

y doy flecha abajo y aplasto la barra espaciadora para poner:

</div>

<div>

\

</div>

<div>

    (X) Idle dynticks system (tickless idle)

</div>

<div>

\

</div>

<div>

y se sale automáticamente a la ventana anterior pero si se aplicó el
cambio, si usted lo que ver, ingrese otra vez allí y verá que ya está
marcado:

</div>

<div>

\

</div>

<div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEj1K1YHYDbkS_7HukJHe_5R4s5h7-RO_K3SUfeNgYq5LFGfbVauTpuOyXPQBugHaTT7kEUzF3Ap271t4CeK2xScuOLlt4aOuiTvMmU5CYB1MFuvZGzLsKjSNP8SaY6xnO_nBRxPrjHmPxp2IAdCRET-dGjeWCaHMJuI0_q6ec9tzx5rD8NjHqUMyvkK7vc=s16000){original-height="579"
original-width="958"}](https://blogger.googleusercontent.com/img/a/AVvXsEj1K1YHYDbkS_7HukJHe_5R4s5h7-RO_K3SUfeNgYq5LFGfbVauTpuOyXPQBugHaTT7kEUzF3Ap271t4CeK2xScuOLlt4aOuiTvMmU5CYB1MFuvZGzLsKjSNP8SaY6xnO_nBRxPrjHmPxp2IAdCRET-dGjeWCaHMJuI0_q6ec9tzx5rD8NjHqUMyvkK7vc){style="margin-left: 1em; margin-right: 1em;"}
:::

\
\

</div>

<div>

</div>

<div>

### \# Enabled CONFIG_PREEMPT_RT

La opción **`CONFIG_PREEMPT_RT`** (habilitada por el parche RT) es
**esencial** para la producción de audio. Estas opciones aseguran que
las tareas del kernel pueden interrumpir otras tareas de manera
agresiva, lo que es crucial cuando necesitas baja latencia y preempción
en tiempo real.\

<div>

-\> General setup

</div>

<div>

</div>

<div>

     -\> Preemption Model (Voluntary Kernel Preemption (Desktop)) 
\-\--\> 

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgXPTby5GGwZRuCdJVuNuHTyt9l_XSbfIJnqTnlPRNUHJFSs4C3YO689w6E11NZD4mZ6rZAB4Sh8grgDUnTeF4wQN2RrB3gwoOXTqteNobAHtXgq6XFdEInGgR3z7HGAkEkGjtfrX1uO3_ZWUF0Ohn81fWcQpHNjqfLEcug_FJKWVxvaBnwE3vymeybbpE=s16000){original-height="582"
original-width="962"}](https://blogger.googleusercontent.com/img/a/AVvXsEgXPTby5GGwZRuCdJVuNuHTyt9l_XSbfIJnqTnlPRNUHJFSs4C3YO689w6E11NZD4mZ6rZAB4Sh8grgDUnTeF4wQN2RrB3gwoOXTqteNobAHtXgq6XFdEInGgR3z7HGAkEkGjtfrX1uO3_ZWUF0Ohn81fWcQpHNjqfLEcug_FJKWVxvaBnwE3vymeybbpE){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

al entrar con Enter está en Voluntary Kernel Preemption o en alguna
opción semejante si usa otra versión de Kernel:

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEhC8oY6PvPnlP7Su5zRUhFmfv0l0sgP98S5PdjR89JuwSi9jgbiah8IiY1Krb9mcS5vlMi86XH8mhpR9C1OxYM4trnjQecqgUDL4TUuL5IdL5WRcutIHqx_edzOEGdDJf37fEBWKJIqHxtODRbly-4HBIOkMftLdsjzOEKmlcEaGKq7dSR7UipK-FZleT4=s16000){original-height="580"
original-width="961"}](https://blogger.googleusercontent.com/img/a/AVvXsEhC8oY6PvPnlP7Su5zRUhFmfv0l0sgP98S5PdjR89JuwSi9jgbiah8IiY1Krb9mcS5vlMi86XH8mhpR9C1OxYM4trnjQecqgUDL4TUuL5IdL5WRcutIHqx_edzOEGdDJf37fEBWKJIqHxtODRbly-4HBIOkMftLdsjzOEKmlcEaGKq7dSR7UipK-FZleT4){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

debe dejarla en:

</div>

<div>

\

</div>

<div>

   (X) Fully Preemptible Kernel (Real-Time)

</div>

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEjFsIhb3OopECYbqf1VFKDMmrGvyuQq8GrSaCKqi3B3-zSBnGjw320WlgfU-iXv_dAxW13rHUsjfi1f9A8L3nIC7KF6Fjcrvz8Sjw8OuzEgIC6nG4K2GyaeUTDPvuHN6Y5IOZjXfl9LGu01EhhPjYJDojQfDRhhbfpk0QivKSnNmT_ixpZWsayKw-NgySQ=s16000){original-height="580"
original-width="964"}](https://blogger.googleusercontent.com/img/a/AVvXsEjFsIhb3OopECYbqf1VFKDMmrGvyuQq8GrSaCKqi3B3-zSBnGjw320WlgfU-iXv_dAxW13rHUsjfi1f9A8L3nIC7KF6Fjcrvz8Sjw8OuzEgIC6nG4K2GyaeUTDPvuHN6Y5IOZjXfl9LGu01EhhPjYJDojQfDRhhbfpk0QivKSnNmT_ixpZWsayKw-NgySQ){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

y como automáticamente se pone la opción anterior, al volver a entrar se
puede ver que ya está activa esa opción

</div>

<div>

 

</div>

</div>

<div>

**Nota:** El nombre podría variar algo en otros Kernel pero el sentido
debe ser algo semejante.\

<div>

\

</div>

<div>

Para la siguiente me voy atrás dando ESC ESC, ESC ESC

</div>

<div>

\

</div>

<div>

###  # Enabled CONFIG_HZ_1000 

<div>

El valor **1000 Hz** es ideal para la producción de audio, ya que
garantiza una frecuencia de temporización más alta y, por lo tanto, una
mayor precisión en el manejo de las interrupciones. Esto reduce la
latencia del sistema y permite que los procesos de audio se ejecuten más
rápidamente:

</div>

<div>

 \

</div>

<div>

-\> Processor type and features

</div>

<div>

     -\> Timer frequency

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEjCybC4ymWwgZj8TxsT-kLqdAvO-6oKJTSD3J52v9AAv7e0TKhod5bG8Aw93Dshknsyh003P4B_OseCRHGvolVO9NEpuHvp4GaMKDdTIdLFVYshr4mIWqgaHSmrR4DFUjx5cPruMhyO0OxXvOEjCGLspB3nVpJVXInhjgEa4EKL70AU9yPWWW4qxBwvsuU=s16000){original-height="582"
original-width="962"}](https://blogger.googleusercontent.com/img/a/AVvXsEjCybC4ymWwgZj8TxsT-kLqdAvO-6oKJTSD3J52v9AAv7e0TKhod5bG8Aw93Dshknsyh003P4B_OseCRHGvolVO9NEpuHvp4GaMKDdTIdLFVYshr4mIWqgaHSmrR4DFUjx5cPruMhyO0OxXvOEjCGLspB3nVpJVXInhjgEa4EKL70AU9yPWWW4qxBwvsuU){style="margin-left: 1em; margin-right: 1em;"}
:::

\
está por defecto en 250 Hz (en este Kernel), debe quedar en 1000

<div>

\

</div>

<div>

 -\> Timer frequency (1000 HZ)

</div>

<div>

\

</div>

<div>

 entre y con la flecla abajo marquela y dé barra espaciadora

</div>

</div>

<div>

\

</div>

salga\
\

<div>

y así queda:

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEgu8al1WNYOys8HDQrdsYBl_Dm5dlMBCtyAj9r_d_vi5bCR6qMIx3-u14Xu92vuJa_DA6DB56xO3l3n2xL5b0f9T7mJb6H10WxS605kIiP8geu3vQmgqQ8vA49aXDDonVN6FJ9DefbChSWqemA1zzc6H3UpFnGqaRNDRpdNHglSn9Budxiz0MkfV6-SaS0=s16000){original-height="583"
original-width="963"}](https://blogger.googleusercontent.com/img/a/AVvXsEgu8al1WNYOys8HDQrdsYBl_Dm5dlMBCtyAj9r_d_vi5bCR6qMIx3-u14Xu92vuJa_DA6DB56xO3l3n2xL5b0f9T7mJb6H10WxS605kIiP8geu3vQmgqQ8vA49aXDDonVN6FJ9DefbChSWqemA1zzc6H3UpFnGqaRNDRpdNHglSn9Budxiz0MkfV6-SaS0){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

</div>

<div>

### \# Enabled CPU_FREQ_DEFAULT_GOV_PERFORMANCE

<div>

**El escalado de frecuencia de CPU** (**`CONFIG_SCHED_CPUFREQ`**) puede
causar fluctuaciones en la frecuencia de la CPU, lo que puede llevar a
**latencias impredecibles**. En un sistema de producción de audio, es
crucial que la frecuencia de la CPU no fluctúe, por lo que necesitas
**forzar el "governor" de la CPU a rendimiento máximo (performance)**:

</div>

<div>

 \

</div>

<div>

-\>  Power management and ACPI options

</div>

<div>

</div>

<div>

   -\> CPU Frequency scaling

</div>

<div>

</div>

<div>

</div>

<div>

      -\> Default CPUFreq governor

</div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/a/AVvXsEg-DD-D_P-89sV2r6VXTyzIiJ37Y4kQmU4ErXYDThzdrQ5FT4MfAAkVennoKMLV7Sx9L5SBvSgFe3-MCB_9pPVYAodZHIbXhYLEn_cT2MO8ef5fHnwZ056b4-WxfYbQLzvWWro71wHa_VTGfqpsoDlplL28-81IFFkeV0tZ_lduB5SaefugRoubVOhk_48=s16000){original-height="575"
original-width="850"}](https://blogger.googleusercontent.com/img/a/AVvXsEg-DD-D_P-89sV2r6VXTyzIiJ37Y4kQmU4ErXYDThzdrQ5FT4MfAAkVennoKMLV7Sx9L5SBvSgFe3-MCB_9pPVYAodZHIbXhYLEn_cT2MO8ef5fHnwZ056b4-WxfYbQLzvWWro71wHa_VTGfqpsoDlplL28-81IFFkeV0tZ_lduB5SaefugRoubVOhk_48){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

dejarlo en:

</div>

<div>

\

</div>

<div>

     (X) performance

</div>

</div>

<div>

\

</div>

<div>

\

</div>

## \# OPCIONAL {#opcional style="text-align: left;"}

### Configura el kernel para habilitar PAE para Sistemas Operativos Linux de 32 bit {#configura-el-kernel-para-habilitar-pae-para-sistemas-operativos-linux-de-32-bit style="text-align: left;"}

<div>

<div>

Si usted tiene un ordenador que sólo soporta 32 bits, o si solo quiera
usar 32 bit aunque soporte 64 bit porque se ponga muy lenta, si usted
tuviera un ordenador con 4GB de RAM lo más seguro es que sólo le esté
reconociendo 3.44 GiB de los 4 GB de RAM si no usa un Kernel PAE, este
es un comportamiento esperado en sistemas operativos de 32 bits debido a
las limitaciones inherentes a esta arquitectura. Esto ocurre porque los
sistemas de 32 bits pueden direccionar un máximo de 4 GB de espacio de
memoria total, lo que incluye tanto la memoria RAM como otros recursos
de hardware, como la memoria dedicada a la tarjeta gráfica y otros
dispositivos de E/S *(\"Entrada/Salida\" en inglés: I/O, Input/Output.
En informática, se refiere a la comunicación entre un sistema
informático y el mundo exterior, que puede ser con dispositivos de
hardware \"dispositivos periféricos\" o con otros sistemas.)*. Por lo
tanto, una parte de la memoria no se puede utilizar para RAM. La
solución es Habilitar PAE (Physical Address Extension) que es una
tecnología que permite a los sistemas operativos de 32 bits acceder a
más de 4 GB de RAM (hasta 64 GB). Debian 12 tiene soporte para PAE, pero
debes asegurarte de estar usando un kernel PAE

</div>

</div>

<div>

\

</div>

<div>

<div>

Navega a la sección :

</div>

<div>

\

</div>

<div>

 -\> Processor type and features 

</div>

<div>

\

</div>

<div>

y habilita la opción (puede que ya esté habilitada por defecto):

</div>

<div>

 

</div>

<div>

\[\*\] PAE (Physical Address Extension) Support

</div>

</div>

<div>

\

</div>

<div>

\

</div>

### Deshabilitar las características de soporte para máquinas virtuales \"Linux Guest Support\" y \"Virtualization\"  {#deshabilitar-las-características-de-soporte-para-máquinas-virtuales-linux-guest-support-y-virtualization style="text-align: left;"}

<div>

<div>

Si deseas deshabilitar las características de soporte para máquinas
virtuales al compilar el kernel de Linux, puedes hacerlo al configurar
el kernel antes de la compilación. Para esto, debes seguir estos pasos
busca las opciones relacionadas con la virtualización, yo he
desabilitado:

</div>

</div>

<div>

\

</div>

<div>

-\> Processor type and features -\> \[ \] Linux Guest Support \-\--\

</div>

<div>

\

</div>

<div>

-\> \[ \] Virtualization \-\-- 

</div>

<div>

 

</div>

<div>

Antes allí estaban unos asteriscos \* pero los desmarqué con la tecla de
tabulación\

</div>

<div>

 

</div>

<div>

Porque no voy a instalar ninguna máquina virtual, ni voy a crear un
Sistema Operativo Linux el cual luego lo voy a instalar dentro de una
máquina virtual (Guest Support)\

</div>

<div>

\

</div>

### Dar ESC hasta ir al inicio.  {#dar-esc-hasta-ir-al-inicio. style="text-align: left;"}

<div>

Si usted al estar realizando este tutorial sin querer llegue hasta
salirse de la ventana por dar varios ESC:

</div>

<div>

\

</div>

<div>

<div>

\

</div>

::: {.separator style="clear: both; text-align: center;"}
[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJ4Nh-pKz6KpEEkGCoUrahtBBpy9jtY53ILF9PjheE6DGorzLYxGssQT_PITRF9pgzmbEQKv5cXCKQ_RJMx2Efa5-G0-YMKdmPL7H5aT_8YCv3QuvBJVUKMK1HxAmmJBg4ilpyx6gn-V370sFgeKJL5ZCPvCrNcmxvEdPHNmynxiEqIewqf5_gQOoQwLM/s16000/20240503-074022%20me%20pregutna%20si%20quiero%20grabar%20los%20cambios.png){border="0"
original-height="318"
original-width="680"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhJ4Nh-pKz6KpEEkGCoUrahtBBpy9jtY53ILF9PjheE6DGorzLYxGssQT_PITRF9pgzmbEQKv5cXCKQ_RJMx2Efa5-G0-YMKdmPL7H5aT_8YCv3QuvBJVUKMK1HxAmmJBg4ilpyx6gn-V370sFgeKJL5ZCPvCrNcmxvEdPHNmynxiEqIewqf5_gQOoQwLM/s680/20240503-074022%20me%20pregutna%20si%20quiero%20grabar%20los%20cambios.png){style="margin-left: 1em; margin-right: 1em;"}
:::

\

<div>

allí dice:

</div>

\
\"Do you wish to save your new configuration? │\
\
│ (Press \<ESC\>\<ESC\> to continue kernel configuration.)\"

que traducido es:

\"¿Desea guardar su nueva configuración? │

 │ (Presione \<ESC\>\<ESC\> para continuar con la configuración del
kernel).\"

darle Enter pues allí dice **YES**

y me dice que las configuraciones han sido escritas al archivo:

.config

 

#### verificar CONFIG_SYSTEM_TRUSTED_KEYS {#verificar-config_system_trusted_keys style="text-align: left;"}

Abra el archivo .config (está oculto, para verlo Ctrl + C) con algún
editor de texto y busque lo siguiente (puede usar el atajo Ctrl + F o en
las opciones del menú):

CONFIG_SYSTEM_TRUSTED_KEYS=\

</div>

<div>

debe estar terminando al final del igual con dos comillas, y si no debe
dejarlo así:

</div>

<div>

 

</div>

<div>

CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\

</div>

<div>

 

</div>

<div>

es porque si tiene algunos textos entre las comillas no lo podrá
compilar. Si lo tuvo que editar y dejarlo como le explico, guarde y
cierre el archivo, y siga.

</div>

<div>

 \

</div>

<div>

En caso de que deseara revisar algo debe poner el comando: 

</div>

<div>

\

</div>

<div>

``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
make menuconfig
```

<div>

\

</div>

<div>

pero sino cierre nomás con Ctrl + C y debe quedar en la terminal.\

</div>

<div>

\

</div>

</div>

<div>

::: {.separator style="clear: both; text-align: left;"}
**Nota:** Además si algún kernel no tenga soporte exFAT, en el siguiente
[tutorial](https://facilitarelsoftwarelibre.blogspot.com/2024/05/compilar-kernel-linux-real-time-en-mx.html){target="_blank"}
búsque la parte de cómo añadí el soporte exFAT en códigos fuentes de
Kernel que no tienen.
:::

::: {.separator style="clear: both; text-align: left;"}
\
:::

### Verificando que las opciones estén bien {#verificando-que-las-opciones-estén-bien .separator style="clear: both; text-align: left;"}

::: {.separator style="clear: both; text-align: left;"}
Cuando salga de menuconfig después de haber hecho las modificaciones,
deberá ver en la terminal algo como esto:
:::

::: {.separator style="clear: both; text-align: left;"}
 
:::

::: {.separator style="clear: both; text-align: left;"}
``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
$ make menuconfig
  HOSTCC  scripts/kconfig/mconf.o
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
  HOSTCC  scripts/kconfig/lxdialog/util.o
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/mconf


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.
```

 
:::

::: {.separator style="clear: both; text-align: left;"}
allí no hay ningún mensaje de error al final, pero podría haberlo,
ejemplo diciendo en inglés:
:::

::: {.separator style="clear: both; text-align: left;"}
 
:::

::: {.separator style="clear: both; text-align: left;"}
``` {.linux-code style="-webkit-text-stroke-width: 0px; background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
.config:5593:warning: symbol value 'm' invalid for RADIO_ADAPTERS
.config:6215:warning: symbol value 'm' invalid for DRM_GEM_SHMEM_HELPER
.config:6859:warning: symbol value 'm' invalid for SND_SOC_SOF_DEBUG_PROBES
.config:6896:warning: symbol value 'm' invalid for SND_SOC_SOF_HDA_PROBES 
```

 
:::

::: {.separator style="clear: both; text-align: left;"}
este tipo de error se debe a que en el archivo de configuración .config
hay valores inválidos para algunas opciones que has seleccionado,
específicamente la opción \'m\' (que indica que el módulo debería
compilarse como módulo, en lugar de ser compilado directamente en el
kernel). Este tipo de advertencias pueden ocurrir cuando se seleccionan
opciones que no son compatibles con el valor que has configurado (por
ejemplo, módulos que no deberían ser módulos o que tienen dependencias
que deben resolverse), eso solo podría pasar si sin querer usted mivió
algo, por lo que de ser así, lo mejor es que borre la carpeta del kernel
y la descomprima otra vez para empezar de cero.\
:::

::: {.separator style="clear: both; text-align: left;"}
:::

::: {.separator style="clear: both; text-align: center;"}
\
:::

### Compinado el Kernel etiquetandolo para crear los .deb  {#compinado-el-kernel-etiquetandolo-para-crear-los-.deb style="text-align: left;"}

Es posible Compilar el Kernel y ponerle una etiqueta como descripción en
los deb generados. En el siguiente ejemplo en LOCALVERSION= está la
etiqueta debian12:\

``` {.linux-code style="background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
make deb-pkg LOCALVERSION=-debian12 KDEB_PKGVERSION=$(make kernelversion)-1
```

\
si se pone eso en la terminal con esa etiqueta será compilado el Kernel
y eso aparecerá en el deb

yo le voy a poner así  **(debe ser sin ningún espacio y no se deben usar
mayúsculas, ni caracteres extraños, ni este caracter \"\_\")** para
saber que fue compilado en Debian 12 y sobre que es un Kernel Real Time
no me preocupo pues eso automáticamente le pone la compilación. 

**Nota:** Si habilitan PAE esto también se añadirá automáticamente a la
compilación. Pero si desabilitan la virtualización sería bueno poner
así: \"debian12-novm\" para saber que tiene desabilitada la
virtualización, esto como ejemplos, ustedes pueden además si desean
escribir algo más en la etiqueta como puede ser escribir pae:
\"debian12-novm-pae\", puede ser su nickname u otro\

y dar ENTER

::: {.separator style="clear: both; text-align: center;"}
\
:::

y ahora si a esperar un buen rato hasta que termine la compilación,
pueden ser horas\

::: {.separator style="clear: both; text-align: center;"}
\
:::

cuando ya fueron generados automáticamente los deb estarán en el
directorio anterior de donde lo compilamos:

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNkzZwlN2gnCMYmZU-eTV7azNYczD4OP5FM4cPTa1VHeYhyphenhyphen3lTMPMwQFw9P8HvLsVSTJIXCV-UtMFDwQeaqWgl9QiWkNIvbdru0CIVXRICZ3plt6TAbK5EEJM11CYTIuZ9F6zQ6FhFVLnctdCAFEuX33cqxLOMR6r8SLYyoBrDyqBVleFJC3_ypjAR1Dc/s16000/20240625-095804%20los%20deb%20del%20kernel%20creados.png){border="0"
original-height="473"
original-width="783"}](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiNkzZwlN2gnCMYmZU-eTV7azNYczD4OP5FM4cPTa1VHeYhyphenhyphen3lTMPMwQFw9P8HvLsVSTJIXCV-UtMFDwQeaqWgl9QiWkNIvbdru0CIVXRICZ3plt6TAbK5EEJM11CYTIuZ9F6zQ6FhFVLnctdCAFEuX33cqxLOMR6r8SLYyoBrDyqBVleFJC3_ypjAR1Dc/s783/20240625-095804%20los%20deb%20del%20kernel%20creados.png){style="margin-left: 1em; margin-right: 1em; text-align: center;"}\

 y para instalarlos sugiero hacer lo siguiente: 

## INSTALACIÓN DE LOS DEB DEL KERNEL

Sólo necesitamos dos los que tienen en el nombre headers e image, menos
el archivo que contiene dbg y el que contiene libc-dev, así que lo mejor
es que cojamos esos dos y los pongamos dentro de otra carpeta y cuando
los tengamos allí instalarlos con:

</div>

<div>

``` {.linux-code style="background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
sudo dpkg -i *.deb
```

 

</div>

## Requerimientos para instalar en otro Linux recién instalado

<div>

Si estos deb los quiere instalar en otro Linux debe instalar el paquete
gcc:

</div>

<div>

\

</div>

<div>

``` {.linux-code style="background-attachment: scroll; background-clip: initial; background-color: #e7e8e9; background-origin: initial; background-position: 0px 0px; background-repeat: no-repeat; background-size: initial; background: url(\"https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgw3zDk6wzJS1YMJnEnxNTUBlJoFkHiX34Zr8jYjH8rQH_UK-NBGd8BJG5ej5D3DUvAUrxu7nU78bYM6DyIpnqnamAjiiI2Cb1e7V47m6b61ZwmeYp7vX1_HLK_O_ZKkgEtskevF8k97l0/s540-Ic42/lincodewachin.gif\") 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \"UbuntuBeta Mono\", \"Ubuntu Mono\", \"Courier New\", Courier, monospace; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"}
sudo apto install gcc dkms
```

 pues sino no se podrá instalar

luego **reiniciar**

\

## **Eligiendo el Kernel RT**

Al iniciar el Sistema Operativo de clic en la opción Avanzada del Grub y
allí elija el kernel que hemos compilado\
\

## Probando si coge mi tarjeta SD {#probando-si-coge-mi-tarjeta-sd style="clear: both;"}

Quería probar los dos puesto que mi laptop Dell Inspiron 1750 tiene una
tarjeta lectora de Memorias SD y funciona bien, que bueno (es que a
veces esa tarjetal lectora no funciona en algún Kernel y sin ella no
puedo usarla y para mi es imprescindible)

 Lo estoy probando y hasta el momento me funciona bien. Pero si en algún
momento no funciona no quedará más que comprar un buen lector de
tarjetas (yo tuve que comprar dos pues el primero no era muy rapido, el
segundo si funciona bien)\

Dios les bendiga

</div>

\

### **CONSULTAS**

**No se puede montar partición exFAT en algún tipo de Linux porque el
Kernel u otro no tiene soporte\
**<https://facilitarelsoftwarelibre.blogspot.com/2023/02/no-se-puede-montar-particion-exfat-en-kernel-linux.html>

**Compilando Kernel de AV Linux en MX Linux 21 de (32 bits y 64 bits)\
**<https://facilitarelsoftwarelibre.blogspot.com/2022/04/compilando-kernel-de-av-linux-en-mx.html>

**Debian build fail due debian/certs/debian-uefi-certs.pem #54\
**<https://github.com/Frogging-Family/linux-tkg/issues/54>

**What is Kernel-PAE in Linux ?**\
<https://www.golinuxhub.com/2014/02/understanding-kernel-pae-in-linux/>

**PuppyLinux : PAE**\
<https://www.wikka.puppylinux.com/PAE>\

<div>

**System configuration \[Linux-Sound\]\
**<https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel>

</div>

</div>
