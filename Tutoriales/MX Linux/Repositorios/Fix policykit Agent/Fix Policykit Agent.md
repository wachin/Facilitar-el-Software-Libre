
# Si usas un Gestor de Ventanas diferente al que viene por defecto en la Distro asegúrate de configurar correctamente a PolicyKit
El siguiente tutorial y funciona bien para sistemas operativos Linux que uno los usa con su gestor de ventanas por defecto, pero si uno instala por ejemplo openbox y uno no ha configurado el policykit agent, el programa "MX Instalador de paquetes" no abre, ejemplo yo instalé en mi ordenador "Debian 12 LXQT" e instalé el repositorio de MX Linux y el programa "MX Instalador de paquetes" abre y se pueden instalar los paquetes que uno necesite incluso de la pestaña "Repositorios de prueba" pero al instalar openbox y cerrar sesión y entrar en la sesión de openbox este no funcionaba hasta que tuve que añadir en el archivo autostart la línea: "lxqt-policykit-agent &". Este problema con el programa **"MX Instalador de paquetes"** al usar **Openbox** en lugar del entorno de escritorio por defecto (como LXQt) está relacionado con la falta de un **agente de PolicyKit** (polkit) configurado correctamente en la sesión de Openbox. A continuación, explico por qué ocurre esto, cómo afecta al funcionamiento de aplicaciones como "MX Instalador de paquetes" y cómo varía según el entorno de escritorio (KDE, GNOME, LXQt, etc.).

## **¿Qué es PolicyKit y por qué es importante?**

**PolicyKit** (o **polkit**) es un sistema en Linux que gestiona los permisos para realizar acciones privilegiadas (como instalar paquetes, montar dispositivos, etc.) de manera segura. Muchas aplicaciones gráficas, como "MX Instalador de paquetes", requieren autenticación para ejecutar comandos con privilegios de administrador (root). Esta autenticación suele presentarse como una ventana emergente que solicita la contraseña del usuario.

Para que esta ventana de autenticación aparezca, debe estar ejecutándose un **agente de PolicyKit** en la sesión del usuario. Cada entorno de escritorio (KDE, GNOME, LXQt, etc.) proporciona su propio agente de PolicyKit, que se inicia automáticamente al comenzar la sesión. Sin embargo, en gestores de ventanas ligeros como **Openbox**, no hay un entorno de escritorio completo, por lo que el agente de PolicyKit no se inicia de forma predeterminada a menos que se configure manualmente.

## **¿Por qué "MX Instalador de paquetes" no abre en Openbox?**

El programa **"MX Instalador de paquetes"** depende de **PolicyKit** para autenticar acciones privilegiadas, como instalar o actualizar paquetes desde los repositorios. Cuando inicias una sesión en **Openbox** sin un agente de PolicyKit activo, la aplicación intenta solicitar permisos, pero no puede mostrar la ventana de autenticación porque el agente no está corriendo. Como resultado, la aplicación falla silenciosamente o no se abre.

## **Diferencias entre entornos de escritorio**

Cada entorno de escritorio utiliza un agente de PolicyKit específico, que se integra con su diseño y estilo visual. Aquí hay una lista de los agentes más comunes:

1. **LXQt**: Usa `lxqt-policykit-agent`. Este es el que configuraste manualmente en Openbox.
2. **GNOME**: Usa `polkit-gnome-authentication-agent-1`, que se inicia automáticamente con la sesión de GNOME.
3. **KDE Plasma**: Usa `polkit-kde-agent-1`, integrado en el entorno de Plasma.
4. **XFCE**: Usa `xfce-polkit` o, en algunos casos, un agente genérico como `lxpolkit`.
5. **Entornos ligeros o gestores de ventanas (como Openbox)**: No incluyen un agente de PolicyKit por defecto, por lo que debes iniciarlo manualmente.

Si cambias de un entorno completo (como LXQt) a un gestor de ventanas como Openbox, el agente de PolicyKit que normalmente se inicia automáticamente en LXQt no se ejecuta, lo que provoca problemas con aplicaciones que requieren autenticación.

## **Configuración del agente de PolicyKit para gestores de ventanas como Openbox**

Si instalas el programa **"MX Instalador de paquetes"** en un sistema Debian con un entorno de escritorio completo como **LXQt**, **GNOME**, o **KDE**, el programa debería funcionar sin problemas, ya que estos entornos inician automáticamente un **agente de PolicyKit** al comenzar la sesión. Sin embargo, si usas un gestor de ventanas ligero como **Openbox**, es posible que "MX Instalador de paquetes" no se abra porque no hay un agente de PolicyKit activo.

**Solución**:

1. **Identifica el agente de PolicyKit adecuado**:
    Puedes buscarlo en Synaptic buscando la palabra:

    PolicyKit

    y ordenando los paquetes instalados, y busca entre todos los paquetes algo que se pueda relacionar y verifica el archivo .desktop que siembre contienen ello:



2. **Añade el agente al inicio de la sesión de Openbox**:
   - Edita el archivo de autostart de Openbox, normalmente ubicado en `~/.config/openbox/autostart`. Si no existe, créalo.
   - Añade la siguiente línea, dependiendo del agente que uses:
     ```bash
      lxqt-policykit-agent &
     ```
     o, si usas otro agente:
     ```bash
     lxpolkit &
     ```
     o:
     ```bash
     /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
     ```
     o:
     ```bash
     /usr/lib/polkit-kde-agent-1 &
     ```

3. **Guarda el archivo y reinicia la sesión**:
   - Cierra la sesión y vuelve a iniciarla en Openbox. Ahora, "MX Instalador de paquetes" debería abrirse correctamente y mostrar la ventana de autenticación cuando sea necesario.

### **Recomendaciones adicionales**

1. **Cómo verificar si un agente está activo**:
   Para verificar si un agente de PolicyKit está ejecutándose:
   ```bash
   ps aux | grep polkit
   ```
   Si no aparece ningún agente (como `lxqt-policykit-agent`, `polkit-gnome-authentication-agent-1`, etc.), entonces no hay un agente activo, y aplicaciones como "MX Instalador de paquetes" no funcionarán correctamente.

2. **Agente genérico**:
   Si el usuario no está seguro de qué agente usar, sugiere instalar `lxpolkit` como una opción ligera y genérica:
   ```bash
   sudo apt install lxpolkit
   ```
   Luego, añádelo al autostart:
   ```bash
   lxpolkit &
   ```
