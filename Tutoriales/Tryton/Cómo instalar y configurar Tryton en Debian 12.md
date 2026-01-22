
# Gestión de Tienda con Tryton en Debian 12 (32-bit)

Este repositorio documenta la instalación y configuración de **Tryton**, un sistema ERP modular, en una máquina con **Debian 12 de 32 bits**, para gestionar una tienda (ventas, inventario, facturación, etc.).

> ✅ Funciona completamente en local, sin dependencia de servicios en la nube.

---

## 🧰 Requisitos del sistema

- Sistema operativo: **Debian 12 (Bookworm)**
- Arquitectura: **i386 (32-bit)**
- Acceso con `sudo`
- Conexión a internet para instalar paquetes

---

## 📦 Paquetes instalados

```bash
sudo apt update
sudo apt install tryton-server tryton-client
```

y los módulos:

```bash
sudo apt install tryton-modules-account \
                 tryton-modules-company \
                 tryton-modules-country \
                 tryton-modules-currency \
                 tryton-modules-party \
                 tryton-modules-product \
                 tryton-modules-sale \
                 tryton-modules-stock \
                 tryton-modules-account-invoice \
                 tryton-modules-account-product
```


> Estos módulos te darán funcionalidades esenciales:
> - **party**: Clientes y proveedores
> - **product**: Gestión de productos
> - **stock**: Inventario y almacén
> - **sale**: Pedidos de venta
> - **account** + **account-invoice**: Facturación y contabilidad

---

## 🗃 Configurar una base de datos

Tryton usa **PostgreSQL** como motor de base de datos (aunque también puede usar SQLite, **solo para pruebas**).

### Instalar y configurar PostgreSQL:

```bash
sudo apt install postgresql
sudo -u postgres createuser -d tryton
sudo -u postgres createdb -O tryton trytondb
```

> Esto crea un usuario `tryton` y una base de datos `trytondb`.

## ⚙️ Configuración paso a paso

### 1. **Iniciar PostgreSQL**

```bash
sudo pg_ctlcluster 15 main start
```

> En Debian, el clúster no se inicia automáticamente. Se verifica con `pg_lsclusters`.

### 2. **Crear usuario y base de datos para Tryton**

```bash
sudo -u postgres createuser -d tryton
sudo -u postgres createdb -O tryton trytondb
```

### 3. **Configurar Tryton**

Archivo: `/etc/tryton/trytond.conf`

el archivo: 

/etc/tryton/trytond.conf

contiene en Debian 12:

```plaintext
# PostgreSQL via Unix domain sockets
# (e.g. PostgreSQL database running on the same machine (localhost))
#uri = postgresql://tryton:tryton@/
#
# PostgreSQL via TCP/IP
# (e.g. connecting to a PostgreSQL database running on a remote machine or
# by means of md5 authentication. Needs PostgreSQL to be configured to accept
# those connections (pg_hba.conf).)
#uri = postgresql://tryton:tryton@localhost:5432/

# The path to the directory where the Tryton Server stores files.
# The server must have write permissions to this directory.
# Default: The db folder under the user home directory running trytond (~/db).
path = /var/lib/tryton
```

**descomenta la primera línea de `uri`**, pero **elimina el nombre de usuario y contraseña** (porque usarás conexión por socket, autenticada por el sistema, sin necesidad de credenciales en el archivo):

```ini
# PostgreSQL via Unix domain sockets
uri = postgresql:///
```

> ⚠️ Nota los **tres slashes**: `postgresql:///`  
> Esto le dice a Tryton: *"Conéctate a PostgreSQL en localhost usando el socket por defecto, con el rol del sistema (usualmente `tryton` si el servidor se ejecuta como ese usuario)"*.

También asegúrate de que la línea `path` esté como ya tienes:

```ini
path = /var/lib/tryton
```

Guarda y cierra (`Ctrl+O`, `Enter`, `Ctrl+X` en nano).

---

## 🔧 Asegúrate de que el directorio `/var/lib/tryton` exista y tenga los permisos correctos

```bash
sudo mkdir -p /var/lib/tryton
sudo chown tryton:tryton /var/lib/tryton
```

> El paquete `tryton-server` normalmente crea este directorio, pero es bueno verificarlo.

---

## 🔄 Reinicia el servicio Tryton

```bash
sudo systemctl restart tryton-server
```

Verifica que no haya errores:

```bash
sudo systemctl status tryton-server
journalctl -u tryton-server -n 20
```

Si todo está bien, no debería mostrar errores de conexión a la base de datos.

---

## 🧪 Inicializa la base de datos Tryton

Ahora sí, inicializa tu base de datos `trytondb`:

```bash
sudo -u tryton trytond-admin -c /etc/tryton/trytond.conf -d trytondb --all
```

Te pedirá:
- Una contraseña para el usuario **admin** de Tryton (guárdala).
- Confirmar que quieres instalar todos los módulos (`--all`).

✅ Si ves un mensaje como `Database initialized`, ¡todo salió bien! (pero esto sólo aparecerá la primera vez)



**descomenta la primera línea de `uri`**, pero **elimina el nombre de usuario y contraseña** (porque usarás conexión por socket, autenticada por el sistema, sin necesidad de credenciales en el archivo):

```ini
# PostgreSQL via Unix domain sockets
uri = postgresql:///
```

> ⚠️ Nota los **tres slashes**: `postgresql:///`  
> Esto le dice a Tryton: *"Conéctate a PostgreSQL en localhost usando el socket por defecto, con el rol del sistema (usualmente `tryton` si el servidor se ejecuta como ese usuario)"*.

También asegúrate de que la línea `path` esté como ya tienes:

```ini
path = /var/lib/tryton
```

Guarda y cierra (`Ctrl+O`, `Enter`, `Ctrl+X` en nano).

---

## 🔧 Asegúrate de que el directorio `/var/lib/tryton` exista y tenga los permisos correctos

```bash
sudo mkdir -p /var/lib/tryton
sudo chown tryton:tryton /var/lib/tryton
```

> El paquete `tryton-server` normalmente crea este directorio, pero es bueno verificarlo.

---

## 🔄 Reinicia el servicio Tryton

```bash
sudo systemctl restart tryton-server
```

Verifica que no haya errores:

```bash
sudo systemctl status tryton-server
journalctl -u tryton-server -n 20
```

Si todo está bien, no debería mostrar errores de conexión a la base de datos.

---

## 🧪 Inicializa la base de datos Tryton

Ahora sí, inicializa tu base de datos `trytondb`:

```bash
sudo -u tryton trytond-admin -c /etc/tryton/trytond.conf -d trytondb --all
```

Te pedirá:
- Una contraseña para el usuario **admin** de Tryton (guárdala).
- Confirmar que quieres instalar todos los módulos (`--all`).

✅ Si ves un mensaje como `Database initialized`, ¡todo salió bien!






```ini
uri = postgresql:///
path = /var/lib/tryton
```

> Usa autenticación por socket Unix (sin contraseña), compatible con la configuración predeterminada de PostgreSQL en Debian.

Permisos del directorio:
```bash
sudo mkdir -p /var/lib/tryton
sudo chown tryton:tryton /var/lib/tryton
```

### 4. **Iniciar el servidor Tryton**

```bash
sudo systemctl start tryton-server
sudo systemctl enable tryton-server  # opcional
```

### 5. **Inicializar la base de datos**

```bash
sudo -u tryton trytond-admin -c /etc/tryton/trytond.conf -d trytondb --all
```

> Esto crea el usuario `admin` y todos los módulos.

### 6. **Restablecer contraseña del usuario `admin` (si es necesario)**

Si se olvida la contraseña, se puede restablecer directamente en PostgreSQL:

```bash
sudo -u postgres psql -d trytondb
```

poniendo

```sql
UPDATE res_user SET password = 'admin123' WHERE login = 'admin';
```

> Esto pondrá la contraseña admin123 que si usted desea puede poner otra. Y Tryton cifrará automáticamente la contraseña en el primer inicio de sesión.

---

## 🖥️ Conexión desde el cliente

1. Abrir el cliente:
   ```bash
   tryton
   ```
2. **Crear un perfil local** (no usar el de demostración):
   - **Host**: `localhost`
   - **Port**: `8000`
   - **Base de datos**: `trytondb`
   - **Usuario**: `admin`
   - **Contraseña**: `admin123` (o la establecida)

> ⚠️ Evitar el perfil predeterminado `demo6.0.tryton.org`, ya que causa errores de conexión en entornos locales.

---

## 📦 Módulos funcionales (activos por defecto)

Con `--all`, se instalaron los módulos clave para una tienda:

- **Party**: Clientes y proveedores
- **Product**: Gestión de productos
- **Stock**: Control de inventario y almacenes
- **Sale**: Pedidos de venta
- **Account + Account Invoice**: Facturación y contabilidad
- **Company**: Configuración de la empresa

Documentación oficial: https://docs.tryton.org

---

## 🛠️ Notas importantes

- **Debian 12 de 32 bits** es compatible, aunque cada vez menos software moderno lo soporta.
- PostgreSQL debe iniciarse manualmente tras cada reinicio (a menos que se active el clúster con `systemctl enable postgresql@15-main`).
- El servidor Tryton escucha en `localhost:8000` por defecto.

---

## ✅ Estado actual

- ✅ PostgreSQL funcionando
- ✅ Base de datos `trytondb` creada e inicializada
- ✅ Servidor Tryton activo
- ✅ Usuario `admin` accesible
- ✅ Cliente conectado localmente
- ✅ Listo para configurar empresa, productos, almacén y ventas

---