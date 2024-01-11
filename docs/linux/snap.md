# Snap

* remove disabled snaps: `snap list --all | awk '/disabled/{print $1, $3}' | while read snapname snaprevision; do sudo snap remove "$snapname" --revision="$snaprevision"; done`