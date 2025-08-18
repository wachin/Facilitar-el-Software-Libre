### 📌 ¿Qué URL debo usar para reutilizar una imagen en Blogger: href o src?

Publicadas por [Washington Indacochea Delgado](https://www.blogger.com/profile/17773143494819856315 "author profile")  [agosto 18, 2025](https://facilitarelsoftwarelibre.blogspot.com/2025/08/que-url-debo-usar-para-reutilizar-una-imagen-en-blogger-href-o-src.html "permanent link")

Si alguna vez has querido usar una imagen de una entrada anterior en un nuevo post de tu blog en **Blogger**, seguramente te has encontrado con un dilema:  
¿Debo copiar la URL del enlace (`href`) o la del origen de la imagen (`src`)?

Vamos a aclararlo de una vez por todas.

---

#### 🔍 El escenario común

Imagina que tienes una entrada con una imagen insertada, y el código HTML se ve algo así:

```
<div class="separator" style="clear: both; text-align: center;">
  <a href="https://blogger.googleusercontent.com/img/a/AVvXsEjpX652hNVrABN1QASxS3bgTiZvC7MDDoRjhIIVs2a0rrQHemqm4vwVZD_mpVAeuiflGv-gyLAW5oxTi6vLmUcq5KKwnPwLVxp0ycoP4jfHSpk24yWO_6TD888U2tjl4aRW_gPvxTCF5eMuoVJ0Ea4J0FxHTnzogi7PhdcSs9K6z5g7PLxzFNRB-u0nX2c">
    <img data-original-height="489" data-original-width="790" 
         src="https://blogger.googleusercontent.com/img/a/AVvXsEjpX652hNVrABN1QASxS3bgTiZvC7MDDoRjhIIVs2a0rrQHemqm4vwVZD_mpVAeuiflGv-gyLAW5oxTi6vLmUcq5KKwnPwLVxp0ycoP4jfHSpk24yWO_6TD888U2tjl4aRW_gPvxTCF5eMuoVJ0Ea4J0FxHTnzogi7PhdcSs9K6z5g7PLxzFNRB-u0nX2c=s16000" 
         title="xinput-plus-openned-in-linux-debian12" />
  </a>
</div>
```

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7RFScQTdKjbUVamUpGfgo7BwDPTS4pfcMojnXYjzSaCXSF4uiftWqtckUGXr5G38IyNLce6K3W2WS1m5rCeCr0qn-v6lynbOjZa12hNNSJqWguzMiJ-ZIdKyVvCVNRkph1NLFj3JPwfHqucQDRVvoo9X7bjn1YDZDM2E-o14X1Y_nudbUb1eLsZOBCcE/s16000-rw/20250818-090532%20el%20codigo%20html%20de%20una%20imagen%20en%20blogger.png "el codigo html del lugar donde está una imagen en blogger")
Y ahora quieres usar **esa misma imagen** en otro post. ¿Cuál URL debes copiar?

---

#### ✅ La respuesta: Usa la URL del `src`

La **URL correcta** es la que aparece en el atributo **`src`** del elemento `<img>`.  
Esta es la que apunta directamente al **archivo de imagen alojado en los servidores de Google** (que Blogger utiliza para el almacenamiento).

> ✅ **`src`** = **Source** (fuente). Es la ubicación real de la imagen.

La URL del `href`, en cambio, es solo un enlace a una **página de visualización** de la imagen (por ejemplo, una página donde se muestra la imagen a tamaño completo). No es la imagen en sí.

---

#### 🛠️ Cómo reutilizar la imagen

1. **Copia la URL del atributo `src`**:
    
```
    https://blogger.googleusercontent.com/img/a/AVvXsEjpX652hNVrABN1QASxS3bgTiZvC7MDDoRjhIIVs2a0rrQHemqm4vwVZD_mpVAeuiflGv-gyLAW5oxTi6vLmUcq5KKwnPwLVxp0ycoP4jfHSpk24yWO_6TD888U2tjl4aRW_gPvxTCF5eMuoVJ0Ea4J0FxHTnzogi7PhdcSs9K6z5g7PLxzFNRB-u0nX2c=s16000
```
    
2. En tu nueva entrada, inserta la imagen usando este código HTML:
    
```
<img src="TU_URL_AQUÍ" alt="Descripción de la imagen" style="max-width: 100%; height: auto;" />
```
    
Por ejemplo:
    
```
    <img src="https://blogger.googleusercontent.com/img/a/AVvXsEjpX652hNVrABN1QASxS3bgTiZvC7MDDoRjhIIVs2a0rrQHemqm4vwVZD_mpVAeuiflGv-gyLAW5oxTi6vLmUcq5KKwnPwLVxp0ycoP4jfHSpk24yWO_6TD888U2tjl4aRW_gPvxTCF5eMuoVJ0Ea4J0FxHTnzogi7PhdcSs9K6z5g7PLxzFNRB-u0nX2c=s16000" 
         alt="xinput-plus en Linux Debian 12" 
         style="max-width: 100%; height: auto; display: block; margin: 0 auto;" />
```
    
Este código hará que la imagen se vea bien en todos los dispositivos y centrada si lo deseas.
    
---

#### 💡 Consejo adicional: Controla el tamaño

El sufijo `=s16000` en la URL indica que Blogger sirve la imagen a un tamaño máximo de 16000px (lo cual es enorme). Puedes cambiarlo para optimizar:

- `=s800` → imagen de hasta 800px de ancho (ideal para blogs).
- `=s1600` → alta calidad, pero más pesada.
- Sin modificar → tamaño original.

Ejemplo:

```
...=s800
```

Así reduces el peso de la página y mejoras el rendimiento.

### Consejo adicional: inserta tu imagen con el botón

Me parece que lo mejor es insertar la imagen con el botón de insertar en el editor de las entradas de Blogger, pero debo verificar más, luego lo confirmaré

---

#### ✅ Conclusión

Cuando quieras reutilizar una imagen de una entrada anterior en Blogger, **siempre usa la URL del atributo `src`**, no la del `href`. Es la forma más directa, eficiente y segura de mostrar la imagen en otro post, sin tener que volver a subirla.
