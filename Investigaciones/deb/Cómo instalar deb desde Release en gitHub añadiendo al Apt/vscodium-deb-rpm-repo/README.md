# vscodium-deb-rpm-repo

Always up-to-date [VSCodium](https://github.com/VSCodium/vscodium) repository

[![Daily Update Status](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/badges/master/pipeline.svg)](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/commits/master)

***Warning:*** repository migrated to Gitlab Pages, [update your configs](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/issues/36#note_395793123)



## How to install for RPM-based Linux distributions

### Step 1 - Add repository

Add the repository

#### Fedora/RHEL:
```sh
sudo tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF
```

#### openSUSE/SUSE:
```sh
sudo tee -a /etc/zypp/repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF
```
### Step 2 - Install app

Then type `codium` in [GNOME Software](https://wiki.gnome.org/Apps/Software) or use your package manager:

```sh
dnf install codium
zypper in codium
```




## How to install for **Debian/Ubuntu/Linux Mint**


### Option 1 - (Recommended)

- Add my key:

    ```sh
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
        | gpg --dearmor \
        | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    ```
 
- Add the repository:

    ```sh
    echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
        | sudo tee /etc/apt/sources.list.d/vscodium.list
    ```

- Update then install vscodium:

    ```sh
    sudo apt update
    sudo apt install codium
    ```

- Then search for `codium` and run it (e.g. the Activities menu from the Gnome Panel, or whatever else you use as your launcher or application manager).


### Option 2 - (Alternative) use `apt-key`

If `software-properties-common` package is available, you can use `apt-add` and `apt-add-repository` to add the repository and its key.

```sh
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
sudo apt-add-repository 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main'
sudo apt update
sudo apt install codium
```


### Option 3 - Debian only

- Install extrepo (if using Debian 10 "buster", from backports):

    ```sh
    sudo apt install extrepo
    ```

- Enable the repository:

    ```sh
    sudo extrepo enable vscodium
    ```

- Update then install vscodium

    ```sh
    sudo apt update
    sudo apt install codium
    ```
### Mirrors

* https://downloads.vscodium.com

* https://vscodium.c7.ee/

To use the mirror replace `https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo` to mirror link in your package manager configuration file.


### Notes for **Debian/Ubuntu/Linux Mint**:

- If your machine is behind the corporate firewall or proxy

    ```sh
    echo 'Acquire { https::Verify-Peer false }' >>/etc/apt/apt.conf.d/99verify-peer.conf
    ```



## Verification

Checksum verification doesn't work because GPG signature changes the size of packages.
You can use `diff -r` for extracted packages or [pkgdiff](https://github.com/lvc/pkgdiff).



## Updates?

[Every](https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/pipelines) 24 hours at 03:00 UTC.




## Packages for another Linux distributions

Just make a pull request.
