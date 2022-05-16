#!/bin/sh

LATEST=`curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
echo -e "\e[0;32mDownload v$LATEST RPM packages...\e[0m"
mkdir -p pkgs/rpms

curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'x86_64.rpm"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl --fail -L -o pkgs/rpms/vscodium-$LATEST-x86_64.rpm \
  || { echo "Failed to download x86_64 rpm"; exit 1; }


curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'aarch64.rpm"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o pkgs/rpms/vscodium-$LATEST-aarch64.rpm

curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'armv7hl.rpm"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o pkgs/rpms/vscodium-$LATEST-armv7hl.rpm


  
echo -e "\e[0;32mDownload v$LATEST DEB packages...\e[0m"
mkdir pkgs/debs

curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'amd64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl --fail -L -o /tmp/vscodium-$LATEST-amd64.deb \
  ||  { echo "Failed to download amd64 deb"; exit 1; }
  
curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o /tmp/vscodium-$LATEST-arm64.deb

curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o /tmp/vscodium-$LATEST-armhf.deb


# reprepro configuration
mkdir pkgs/debs/conf
touch pkgs/debs/conf/{option,distributions}
echo 'Codename: vscodium' >> pkgs/debs/conf/distributions
echo 'Components: main' >> pkgs/debs/conf/distributions
echo 'Architectures: amd64 i386 arm64 armhf' >> pkgs/debs/conf/distributions
echo 'SignWith: 4FA3594D' >> pkgs/debs/conf/distributions


echo -e "\e[0;32mSign the repositories\e[0m"
# extract the public and private GPG keys from encrypted archive keys.tar with 
# the secret openssl pass KEY, which is stored in GitlabCI variables
openssl aes-256-cbc -d -in keys.tar.enc -out keys.tar -k $KEY
tar xvf keys.tar
#signing the repository metadata with my personal GPG key
gpg2 --import keys/pub.gpg && gpg2 --import keys/priv.gpg
expect -c "spawn gpg2 --edit-key 1302DE60231889FE1EBACADC54678CF75A278D9C trust quit; send \"5\ry\r\"; expect eof"
rpm --define "_gpg_name Pavlo Rudyi <paulcarroty@riseup.net>" --addsign pkgs/rpms/*rpm

# generate and sign RPM repository
# createrepo pkgs/rpms/         # obsoleted tool
createrepo_c --database --compatibility pkgs/rpms/
gpg2 --local-user "Pavlo Rudyi <paulcarroty@riseup.net>" --yes --detach-sign --armor pkgs/rpms/repodata/repomd.xml

# generate new deb repository
reprepro -V -b pkgs/debs includedeb vscodium /tmp/*deb


echo -e "\e[0;32mList of imported public and private keys:"
gpg2 --list-keys && gpg2 --list-secret-keys

echo -e "\e[0;32mDeploy to Gitlab Pages...\e[0m"

# DOCS
# https://linux.die.net/man/8/createrepo
# http://manpages.ubuntu.com/manpages/trusty/man1/dpkg-scanpackages.1.html
# https://github.com/circleci/encrypted-files

