#!/bin/bash

#    PPA Uploader: GUI tool for uploading packages to a PPA on launchpad.net.
#    Copyright (C) 2017  Pavel Řehák
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Version 0.3.0


echo '' > messages.po
# Add strings to empty messages.po
xgettext -L Shell --join-existing --files-from=POTFILES.in

msgmerge -N deb-cup.pot messages.po > new.pot
mv new.pot deb-cup.pot

msgmerge -N cs.po messages.po > new.po
mv new.po cs.po

rm messages.po


# Old
#xgettext -o deb-cup.pot  -L Shell  --keyword --keyword=gettext --keyword=eval_gettext ../deb-cup

