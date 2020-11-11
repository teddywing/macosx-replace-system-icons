#!/bin/sh

# icns-millefeuille.sh
#
# Takes an icns file and adds missing @1x and 32px sizes. Creates a new icns
# file based on the input in the current directory.

EX_USAGE=64

if [ $# -ne 1 ]; then
	echo >&2 'usage: icns-millefeuille.sh ICNS_FILE'
	exit $EX_USAGE
fi

original_icon="$1"
icon="$(basename "$original_icon")"
iconset="${icon/.icns/.iconset}"

cp -a "$original_icon" .

iconutil -c iconset "$icon"

cd "$iconset"

cp icon_16x16\@2x.png icon_32x32.png

sips -Z 512 icon_512x512\@2x.png --out icon_512x512.png
sips -Z 256 icon_256x256\@2x.png --out icon_256x256.png
sips -Z 128 icon_128x128\@2x.png --out icon_128x128.png
sips -Z 64 icon_128x128.png --out icon_32x32\@2x.png
sips -Z 16 icon_16x16\@2x.png --out icon_16x16.png

cd ..

iconutil -c icns "$iconset"

rm -rf "$iconset"
