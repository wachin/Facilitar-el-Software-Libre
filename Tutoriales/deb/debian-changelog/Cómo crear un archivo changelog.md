


Cuando no existe el archivo changelog , se pone uno en la raíz del proyecto y se pone:

`dch --create`

me pide que eliga cual editor, le pongo nano y encima le pego el changelog de shutter encoder https://www.shutterencoder.com/changelog.html


así y como se explica en el siguiente post:

You can create `debian/changelog` with `dch --create` (from `devscripts` package) and fill the changelog template created with package name, version, and distribution. (on later package version, you'd use `dch -i` to add new changelog entries and update the version)

Also, for some reason, I had to comment out 'Source:' line in file I run `equivs-build` on, then it worked without `dh_installchangelogs` throwing errors.


packaging - equivs-build: fatal error occurred while parsing debian/changelog - Ask Ubuntu
https://askubuntu.com/questions/1155018/equivs-build-fatal-error-occurred-while-parsing-debian-changelog
https://askubuntu.com/a/1176967/145772
