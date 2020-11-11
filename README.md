macosx-replace-system-icons
===========================

Replace the Mac OS X system icons. The `icons.sh` script is an automated way to
customise icons in the vein of [CandyBar] and [LiteIcon]. It can be used to
apply an icon set like the stylish [Agua] from the [Iconfactory].


## Usage
Create a directory called `Icons` at the root of the repository, and copy the
icon files into it. The script may need to be modified to add or remove icon
references as desired.

The following bundles will be backed up and icons they contain will be replaced:

* `/System/Library/CoreServices/Dock.app`
* `/System/Library/CoreServices/CoreTypes.bundle`
* `/System/Library/Extensions/IOStorageFamily.kext`
* `/System/Library/Extensions/IOSCSIArchitectureModelFamily.kext`
* `/System/Library/Extensions/IOCDStorageFamily.kext`
* `/System/Library/Extensions/IODVDStorageFamily.kext`
* `/System/Library/Extensions/IOBDStorageFamily.kext`

Icon caches are then cleared. In order to load the new icons, the computer must
be restarted.

If the replacement icns files don't include the required icon sizes, the new
icons won't load correctly. For example, the Agua icons include seven size
variants while Mac OS X 10.12 Sierra's have 10 variants. The
`icns-millefeuille.sh` script will try to add the missing variants by scaling
larger variants down. It works for Agua icons, but may not work out of the box
for others.


## License
Copyright © 2020 Teddy Wing. Licensed under the GNU GPLv3+ (see the included
COPYING file).


[CandyBar]: https://panic.com/blog/candybar-mountain-lion-and-beyond/
[LiteIcon]: https://freemacsoft.net/liteicon/
[Agua]: https://freeware.iconfactory.com/preview/agua
[Iconfactory]: https://iconfactory.com/
