

## 2.4. Sections[¶](https://www.debian.org/doc/debian-policy/ch-archive.html#s-subsections#sections "Permalink to this headline")

The packages in the archive areas _main_, _contrib_ and _non-free_ are grouped further into _sections_ to simplify handling.

The archive area and section for each package should be specified in the package’s `Section` control record (see [Section](https://www.debian.org/doc/debian-policy/ch-archive.html#s-subsectionsch-controlfields.html#s-f-section)). However, the maintainer of the Debian archive may override this selection to ensure the consistency of the Debian distribution. The `Section` field should be of the form:

-   _section_ if the package is in the _main_ archive area,
    
-   _area/section_ if the package is in the _contrib_ or _non-free_ archive areas.
    

The Debian archive maintainers provide the authoritative list of sections. 

At present, they are: 

admin, cli-mono, comm, database, debug, devel, doc, editors, education, electronics, embedded, fonts, games, gnome, gnu-r, gnustep, graphics, hamradio, haskell, httpd, interpreters, introspection, java, javascript, kde, kernel, libdevel, libs, lisp, localization, mail, math, metapackages, misc, net, news, ocaml, oldlibs, otherosfs, perl, php, python, ruby, rust, science, shells, sound, tasks, tex, text, utils, vcs, video, web, x11, xfce, zope. 


The additional section _debian-installer_ contains special packages used by the installer and is not used for normal Debian packages.

For more information about the sections and their definitions, see the [list of sections in unstable](https://packages.debian.org/unstable/).
