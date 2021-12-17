#!/bin/bash

if ! command -v wget &> /dev/null
then
    echo "Error: this script requires the wget utility."
    exit
fi

echo status:
for LINKFILE in `find . -name "*.link"`; do
    DARSHANFILE=${LINKFILE%.link}
    echo "    ${DARSHANFILE}"
    if [ -f $DARSHANFILE ] ; then
        echo "        - already present, skipping."
    else
        echo "        - not present, downloading..."
        wget -nv `cat $LINKFILE` -O $DARSHANFILE
    fi
done
echo done.
