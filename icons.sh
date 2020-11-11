#!/bin/sh

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

DOCK=/System/Library/CoreServices/Dock.app

CORE_TYPES=/System/Library/CoreServices/CoreTypes.bundle

IO_STORAGE_FAMILY=/System/Library/Extensions/IOStorageFamily.kext
IO_SCSI_ARCHITECTURE_MODEL_FAMILY=/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext
IO_CD_STORAGE_FAMILY=/System/Library/Extensions/IOCDStorageFamily.kext
IO_DVD_STORAGE_FAMILY=/System/Library/Extensions/IODVDStorageFamily.kext
IO_BD_STORAGE_FAMILY=/System/Library/Extensions/IOBDStorageFamily.kext

REPLACEMENT="$(cd "$(dirname "$0")" && pwd)/Icons"

# Authenticate
sudo -v

# Backup system files
NOW=$(date +%Y-%m-%dT%H:%M:%S%z)

sudo tar czf "${DOCK}.backup-${NOW}.tar.gz" "$DOCK"
sudo tar czf "${CORE_TYPES}.backup-${NOW}.tar.gz" "$CORE_TYPES"
sudo tar czf "${IO_STORAGE_FAMILY}.backup-${NOW}.tar.gz" "$IO_STORAGE_FAMILY"
sudo tar czf "${IO_SCSI_ARCHITECTURE_MODEL_FAMILY}.backup-${NOW}.tar.gz" "$IO_SCSI_ARCHITECTURE_MODEL_FAMILY"
sudo tar czf "${IO_CD_STORAGE_FAMILY}.backup-${NOW}.tar.gz" "$IO_CD_STORAGE_FAMILY"
sudo tar czf "${IO_DVD_STORAGE_FAMILY}.backup-${NOW}.tar.gz" "$IO_DVD_STORAGE_FAMILY"
sudo tar czf "${IO_BD_STORAGE_FAMILY}.backup-${NOW}.tar.gz" "$IO_BD_STORAGE_FAMILY"

# Dock icons
sips -s format png --resampleHeightWidthMax 128 "${REPLACEMENT}/TrashIcon.icns" --out /tmp/trashempty.png
sips -s format png --resampleHeightWidthMax 256 "${REPLACEMENT}/TrashIcon.icns" --out '/tmp/trashempty@2x.png'

sips -s format png --resampleHeightWidthMax 128 "${REPLACEMENT}/FullTrashIcon.icns" --out /tmp/trashfull.png
sips -s format png --resampleHeightWidthMax 256 "${REPLACEMENT}/FullTrashIcon.icns" --out '/tmp/trashfull@2x.png'

sips -s format png --resampleHeightWidthMax 128 "${REPLACEMENT}/FinderIcon.icns" --out /tmp/finder.png
sips -s format png --resampleHeightWidthMax 256 "${REPLACEMENT}/FinderIcon.icns" --out '/tmp/finder@2x.png'

sudo cp -f /tmp/trashempty.png "${DOCK}/Contents/Resources/"
sudo cp -f '/tmp/trashempty@2x.png' "${DOCK}/Contents/Resources/"
sudo cp -f /tmp/trashfull.png "${DOCK}/Contents/Resources/"
sudo cp -f '/tmp/trashfull@2x.png' "${DOCK}/Contents/Resources/"
sudo cp -f /tmp/finder.png "${DOCK}/Contents/Resources/"
sudo cp -f '/tmp/finder@2x.png' "${DOCK}/Contents/Resources/"

# Set icons
read -r -d '' icons <<'EOF'
ApplicationsFolderIcon.icns
BD-R.icns
BD-RE.icns
BD.icns
BurnableFolderIcon.icns
BurningIcon.icns
CD-R.icns
CD-RW.icns
CD.icns
ConnectToIcon.icns
DVD+R.icns
DVD+RW.icns
DVD-R.icns
DVD-RAM.icns
DVD-RW.icns
DVD.icns
DesktopFolderIcon.icns
DeveloperFolderIcon.icns
DocumentsFolderIcon.icns
DownloadsFolder.icns
DropFolderBadgeIcon.icns
EjectMediaIcon.icns
External.icns
FinderIcon.icns
FireWireHD.icns
FullTrashIcon.icns
GenericAirDiskIcon.icns
GenericApplicationIcon.icns
GenericFileServerIcon.icns
GenericFolderIcon.icns
GenericNetworkIcon.icns
GroupFolder.icns
HomeFolderIcon.icns
Internal.icns
LibraryFolderIcon.icns
MovieFolderIcon.icns
MusicFolderIcon.icns
OpenFolderIcon.icns
PicturesFolderIcon.icns
PrivateFolderBadgeIcon.icns
PublicFolderIcon.icns
Removable.icns
SitesFolderIcon.icns
SmartFolderIcon.icns
SystemFolderIcon.icns
TimeMachine.icns
ToolbarDeleteIcon.icns
ToolbarInfo.icns
TrashIcon.icns
USBHD.icns
UsersFolderIcon.icns
UtilitiesFolder.icns
iDiskGenericIcon.icns
EOF

for icon in $icons; do
	for location in "${CORE_TYPES}/Contents/Resources" \
			"${IO_STORAGE_FAMILY}/Contents/Resources" \
			"${IO_SCSI_ARCHITECTURE_MODEL_FAMILY}/Contents/Resources" \
			"${IO_CD_STORAGE_FAMILY}/Contents/Resources" \
			"${IO_DVD_STORAGE_FAMILY}/Contents/Resources" \
			"${IO_BD_STORAGE_FAMILY}/Contents/Resources"; do
		if [ -f "${location}/${icon}" ]; then
			sudo cp -f "${REPLACEMENT}/${icon}" "${location}/${icon}"
		fi
	done
done

# Clear icon cache
sudo find /private/var/folders/ -name 'com.apple.dock.iconcache' -delete
sudo find /private/var/folders/ -name 'com.apple.iconservices' -delete
sudo mv /Library/Caches/com.apple.iconservices.store $HOME/.Trash/

echo 'Please restart this machine for icon changes to take effect'
