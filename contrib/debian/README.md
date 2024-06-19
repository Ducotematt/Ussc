
Debian
====================
This directory contains files used to package usscd/ussc-qt
for Debian-based Linux systems. If you compile usscd/ussc-qt yourself, there are some useful files here.

## usscoin: URI support ##


ussc-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install ussc-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your ussc-qt binary to `/usr/bin`
and the `../../share/pixmaps/ussc128.png` to `/usr/share/pixmaps`

ussc-qt.protocol (KDE)

