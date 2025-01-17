#! /bin/sh

echo "Install kde-service-menu-encfs system side"

bin_dir="$(kf5-config --path exe | sed "s/.*://")"
if [ ! -d "${bin_dir}" ]; then
	sudo mkdir -p "${bin_dir}"
	sudo cp bin/* ${bin_dir}
fi

desktop_dir="$(kf5-config --path services | sed "s/.*://")ServiceMenus/"
if [ ! -d "${desktop_dir}" ]; then
	sudo mkdir -p "${desktop_dir}"
	sudo cp ServiceMenus/* ${desktop_dir}
fi

doc_dir="/usr/share/doc/kde-service-menu-encfs/"
if [ ! -d "${doc_dir}" ]; then
	sudo mkdir -p "${doc_dir}"
	sudo cp doc/* ${doc_dir}
fi

echo "OK"
