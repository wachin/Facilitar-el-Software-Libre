
Se me ha ocurrido una idea, tengo instalado nnn y Konsole, y he creado el siguiente script:

#!/bin/sh
konsole -p tabtitle='PFSLE' -e nnn "auto-push-script-2.sh"

lo he guardado con el nombre:

"Script open auto-push-script-2.sh"

y he creado allí al lado otro script llamado:

auto-push-script-2.sh

este contiene:

#!/bin/bash

### Proyecto 1
echo "Agregando cambios al stage..."
git add .
echo "Realizando commit..."
git commit -m "Guardar automáticamente el commit P1 $(date)"
echo "Enviando cambios al repositorio remoto..."
git push origin main
echo "Proceso finalizado."
read

Entonces al darle doble clic al script:

"Script open auto-push-script-2.sh"

se abre una instancia de Konsole donde está seleccionado por nnn el script: auto-push-script-2.sh lo cual está bien, y al darle Enter aparece el siguiente mensaje:

Advertencia: No fue posible encontrar «», iniciando «/bin/bash» en su lugar. Revise la configuración de su perfil.

pero no entiendo porqué aparece este mensaje,si bien lo demás funciona bien pues he podido enviar los cambios al remoto en github


