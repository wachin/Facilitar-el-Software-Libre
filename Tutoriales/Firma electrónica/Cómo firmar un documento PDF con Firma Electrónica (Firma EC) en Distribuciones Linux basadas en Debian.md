
Tutorial paso a paso para usar Firma EC en Sistemas Operativos basadso en Debian:

### **1. Configuración inicial**
1. Asegúrate de que Java esté correctamente instalado. Puedes verificarlo con:
   ```bash
   java -version
   ```
   Si no está instalado o necesitas actualizarlo, usa:
   ```bash
   sudo apt install default-jre
   ```
2. Abre Firma EC desde el menú de aplicaciones o ejecuta:
   ```bash
   firmaec
   ```
   
### **2. Descarga e instalación de Firma EC**
1. Ve al sitio oficial de [Firma EC](https://www.firmadigital.gob.ec/wp-content/uploads/2018/05/Manual-Usuario-FirmaEC-.pdf) y descarga la versión para "Distribuciones basadas en Debian".
2. Una vez descargado el archivo `.deb`, abre una terminal y navega al directorio donde se encuentra el archivo.
3. Instala el paquete con el siguiente comando:
   ```bash
   sudo dpkg -i nombre_del_archivo.deb
   ```
   Reemplaza `nombre_del_archivo.deb` con el nombre exacto del archivo descargado.
4. Si encuentras errores de dependencias, corrígelos con:
   ```bash
   sudo apt-get install -f
   ```

### **3. Firma de documentos con certificado en archivo**
1. Abre Firma EC
2. En el programa en "**Certificado en**" selecciona "**Archivo**" y da clic en "**Examinar**" y carga tu archivo de firma electrónica (normalmente un archivo `.p12` o `.pfx`) e ingresa la contraseña asociada en el apartado para ella. En caso de que el archivo que descargaste en Linux no tenga extensión, escríbela manualmente, prueba con ambas, yo uso .pfx para la firma que adquirí en [https://portal-sd.securitydata.net.ec/](https://portal-sd.securitydata.net.ec/)
3. En "**DOCUMENTOS (S) SELECCIONADO (S)**" en "**Examinar**" selecciona el documento PDF que deseas firmar, debe estar en PDF.
4. Define la ubicación de la firma en el documento y confirma.

### **4. Verificación de documentos firmados**
1. Si necesitas verificar un documento firmado, selecciona la opción correspondiente en Firma EC.
2. Carga el documento firmado y revisa los detalles de la firma, como la validez y el emisor.

### **5. Validación de certificados**
1. Para validar tu certificado, selecciona la opción de validación en el software.
2. Carga tu archivo de firma y verifica los detalles del certificado, como la fecha de expiración y el emisor.

Si necesitas más detalles, puedes consultar el [manual oficial de usuario](https://www.firmadigital.gob.ec/wp-content/uploads/2018/05/Manual-Usuario-FirmaEC-.pdf) o explorar tutoriales en video como [Descargar e instalar FIRMA EC - Firmar PDF - Validar archivos firmados | DigitalEducas](https://www.youtube.com/watch?v=dm5mHbGTI4k) que explica el proceso de manera visual.
