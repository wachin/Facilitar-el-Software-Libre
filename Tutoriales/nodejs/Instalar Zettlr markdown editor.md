
Zettlr/Zettlr: A Markdown Editor for the 21st century.
https://github.com/Zettlr/Zettlr


Then, simply clone the repository and install the dependencies on your local computer:

$ git clone https://github.com/Zettlr/Zettlr.git
$ cd Zettlr
$ yarn install --frozen-lockfile


y luego poner 

npm start

o 

yarn start

para lanzarlo


yarn package:linux-x64

yarn package:linux-x32


wachin@mx21:~/Dev/Zettlr
$ npm start

> zettlr@2.3.0 start
> cross-env NODE_ENV=develop electron-forge start

✔ Checking your system
✔ Locating Application
✔ Preparing native dependencies

Building for an unsupported platform/arch-combination linux/ia32 - not bundling Pandoc.
✔ Compiling Main Process Code
✔ Launch Dev Servers
⠴ Compiling Preload ScriptsIssues checking in progress...
⠴ Compiling Preload ScriptsIssues checking in progress...
⠼ Compiling Preload ScriptsIssues checking in progress...
⠧ Compiling Renderer CodeIssues checking in progress...



wachin@mx21:~/Dev/Zettlr
$ yarn start
yarn run v1.22.19
warning ../../package.json: No license field
$ cross-env NODE_ENV=develop electron-forge start
✔ Checking your system
✔ Locating Application
✔ Preparing native dependencies

Building for an unsupported platform/arch-combination linux/ia32 - not bundling Pandoc.

