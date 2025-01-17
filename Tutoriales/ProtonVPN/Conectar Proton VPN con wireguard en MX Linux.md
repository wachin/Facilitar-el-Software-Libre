How to use WireGuard with NetworkManager on Ubuntu 

This guide was created on Ubuntu 20.04 LTS, but should work on most Debian and Ubuntu-based distros.

1. Open a terminal window from your Home directory and install WireGuard using the following command:

sudo apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf

2. Sign in to account.protonvpn.com, go to Downloads → WireGuard configuration, and download a WireGuard configuration file.

Learn how to download a WireGuard configuration file from Proton VPN 

3. Clone the NetworkManager plugin from GitHub, compile, and install it using the following commands:

git clone https://github.com/max-moser/network-manager-wireguard

cd network-manager-wireguard

./autogen.sh --without-libnm-glib

./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var

Para 32 bit

./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/i386-linux-gnu/ --libexecdir=/usr/lib/NetworkManager --localstatedir=/var


make   

sudo make install

4. Open NetworkManager → VPN → +.
Add a new VPN connection in NetworkManager

5. If the WireGuard option is not available, restart your computer and try again. If it is, select Import from file… 
Select Import from file...

6. Locate the .conf configuration file you downloaded in step 2 using your file manager and click Add.
Add the downloaded WireGuard config file

7. Configuration is now complete. In NetworkManager, simply toggle the VPN switch next to the WireGuard connection you just created to on.
Connect to ProtonVPN using WireGuuard

You are now connected to ProtonVPN using the WireGuard protocol. Visit ip.me to confirm that the VPN connection is working correctly.
Visit ip.me to confirm that the VPN connection is working correctly