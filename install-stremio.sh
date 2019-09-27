#!/bin/sh
if [ "$UID" != "0" ]; then
	echo "You need to be root to run this"
	exit 1
fi

if [ ! -f "./stremio.png" ]; then
	wget https://archive.org/download/stremio/stremio.png
fi

if [ ! -f "./Stremio+4.0.0-beta.20.appimage" ]; then
	wget https://dl.strem.io/linux/v4.0.0-beta.20/Stremio+4.0.0-beta.20.appimage
fi

mkdir -p /opt/Stremio4.0/
chmod +x Stremio+4.0.0-beta.20.appimage 
mv Stremio+4.0.0-beta.20.appimage /opt/Stremio4.0
ln -sf /opt/Stremio4.0/Stremio+4.0.0-beta.20.appimage /usr/bin/stremio
echo "" > /usr/share/applications/stremio.desktop
cat > /usr/share/applications/stremio.desktop << EOF 
[Desktop Entry]
Version=4.0.0
Type=Application
Name=Stremio
GenericName=Media Center
Terminal=false
Comment=Watch instantly all the video content you enjoy in one place
Icon= /usr/share/icons/hicolor/96x96/apps/stremio.png
Exec=/usr/bin/stremio
Categories=AudioVideo;Video;Audio;Player; 
EOF
mkdir -p /usr/share/icons/hicolor/96x96/apps/
mv stremio.png /usr/share/icons/hicolor/96x96/apps/stremio.png 
