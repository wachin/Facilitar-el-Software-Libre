



https://github.com/deepin-espanol/deepines-store/blob/nightly/repo-fix.sh






    Fmt="printf"

    APTDIR=/etc/apt
    SRCLIST=${APTDIR}/sources.list
    DEEPINESLIST="${SRCLIST}.d/deepines.list"

    STABLEDIST="apricot"
    STABLEREPO="## Generated by deepin-installer
    deb https://community-packages.deepin.com/deepin/ apricot main contrib non-free
    #deb-src https://community-packages.deepin.com/deepin/ apricot main contrib non-free"

    BETADIST="bullseye"
    BETAREPO="## Generated by deepin-installer
    deb https://proposed-packages.deepin.com/dde-nightly/ bullseye main contrib non-free
    deb https://proposed-packages.deepin.com/dde-nightly/ deepin-bullseye main contrib non-free
    deb https://proposed-packages.deepin.com/dde-nightly/ dde-bullseye main contrib non-free
    deb https://proposed-packages.deepin.com/dde-nightly/ deepin-wine main contrib non-free
    deb-src https://proposed-packages.deepin.com/dde-nightly/ bullseye main contrib non-free
    deb-src https://proposed-packages.deepin.com/dde-nightly/ deepin-bullseye main contrib non-free
    deb-src https://proposed-packages.deepin.com/dde-nightly/ dde-bullseye main contrib non-free
    deb-src https://proposed-packages.deepin.com/dde-nightly/ deepin-wine main contrib non-free"
