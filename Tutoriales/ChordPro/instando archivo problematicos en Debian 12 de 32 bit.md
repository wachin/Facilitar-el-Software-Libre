


#### **3. instalar manualmente JavaScript::QuickJS**:

```bash
# Descargar el código fuente
wget http://www.cpan.org/authors/id/F/FE/FELIPE/JavaScript-QuickJS-0.21.tar.gz
tar -xzvf JavaScript-QuickJS-0.21.tar.gz
cd JavaScript-QuickJS-0.21
```

Configurar y compilar manualmente

```bash
perl Makefile.PL
```

si sale el siguiente mensaje no es un error:

```bash
Checking if your kit is complete...
Looks good
Warning: prerequisite Test::Deep 0 not found.
Warning: prerequisite Test::FailWarnings 0 not found.
Warning: prerequisite Test::Fatal 0 not found.
Generating a Unix-style Makefile
Writing Makefile for JavaScript::QuickJS
Writing MYMETA.yml and MYMETA.json
```

sino advertencias sobre dependencias opcionales de pruebas (Test::Deep, Test::FailWarnings, Test::Fatal). El proceso de configuración (Makefile.PL) se completó correctamente y generó los archivos necesarios para la compilación, continuar nomás 

```bash
make
sudo make install
```

Verificar que los módulos estén instalados:

```bash
perl -MJavaScript::QuickJS -e 'print "Módulo instalado\n"'
```

si se instaló, dirá:

```bash
Módulo instalado
```

---

### 📌 **Posibles problemas adicionales**:
**En Debian 12 `libquickjs-dev` no está disponible , instalarlo desde código fuente**:  
   Instala desde fuentes alternativas:
   
```bash
# Instalar QuickJS desde el repositorio oficial
git clone https://github.com/bellard/quickjs.git
cd quickjs
make && sudo make install
```


