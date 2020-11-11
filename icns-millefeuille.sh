#!/bin/sh

# icns-millefeuille.sh
#
# Takes an icns file and adds missing @1x and 32px sizes. Creates a new icns
# file based on the input in the current directory.

# Copyright (c) 2020  Teddy Wing
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

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
