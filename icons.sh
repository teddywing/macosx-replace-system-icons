#!/bin/sh

CORE_TYPES=/System/Library/CoreServices/CoreTypes.bundle
GENERIC_ICONS=/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources

REPLACEMENT="$(cd "$(dirname "$0")" && pwd)/Icons"

# Authenticate
sudo -v

# Backup CoreTypes.bundle
sudo cp -R "$CORE_TYPES" "${CORE_TYPES}.backup"

# Set icons
sudo cp -f "$REPLACEMENT/ApplicationsFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/BD-R.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/BD-RE.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/BD.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/BurnableFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/BurningIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/CD-R.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/CD-RW.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/CD.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/ConnectToIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD+R.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD+RW.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD-R.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD-RAM.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD-RW.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DVD.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DesktopFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DeveloperFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DocumentsFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DownloadsFolder.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/DropFolderBadgeIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/EjectMediaIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/External.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/FinderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/FireWireHD.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/FullTrashIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GenericAirDiskIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GenericApplicationIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GenericFileServerIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GenericFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GenericNetworkIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/GroupFolder.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/HomeFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/Internal.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/LibraryFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/MovieFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/MusicFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/OpenFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/PicturesFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/PrivateFolderBadgeIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/PublicFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/Removable.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/SitesFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/SmartFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/SystemFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/TimeMachine.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/ToolbarDeleteIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/ToolbarInfo.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/TrashIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/USBHD.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/UsersFolderIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/UtilitiesFolder.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/iDiskGenericIcon.icns" "$GENERIC_ICONS/"
sudo cp -f "$REPLACEMENT/iDiskUserIcon.icns" "$GENERIC_ICONS/"

# Clear icon cache
sudo find /private/var/folders/ -name 'com.apple.dock.iconcache' -delete
sudo find /private/var/folders/ -name 'com.apple.iconservices' -delete
sudo mv /Library/Caches/com.apple.iconservices.store $HOME/.Trash/
