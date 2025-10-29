#!/bin/bash

if command -v wget >/dev/null 2>&1; then
    DOWNLOAD() { wget -nv -O "$1" "$2"; }
elif command -v curl >/dev/null 2>&1; then
    DOWNLOAD() { curl -fsSL -o "$1" "$2"; }
else
    echo "Error: need either 'wget' or 'curl' installed." >&2
    exit 1
fi

echo status:
for LINKFILE in `find . -name "*.link"`; do
    DARSHANFILE=${LINKFILE%.link}
    echo "    ${DARSHANFILE}"
    if [ -f $DARSHANFILE ] ; then
        echo "        - already present, skipping."
    else
        echo "        - not present, downloading..."
        DOWNLOAD "$DARSHANFILE" `cat $LINKFILE`
    fi
done
echo done.
