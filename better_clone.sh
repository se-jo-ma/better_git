#!/bin/bash

GH_FLAG=false
while getopts "Gg" opt; do
    case $opt in
        g|G)
            GH_FLAG=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
shift $((OPTIND-1))

if [ -n "$1" ]; then
    REPO_LOC="$1"
    if [ "$GH_FLAG" = true ]; then
        REPO_LOC="https://github.com/$REPO_LOC.git"
    fi
    if [[ "$REPO_LOC" != *".git" ]]; then
        REPO_LOC="$REPO_LOC.git"
    fi
fi

DESTINATION="$(dirname "$0")"
if [ -n "$2" ]; then
    DESTINATION="$2"
fi

if [ -d "$DESTINATION" ]; then
    cd "$DESTINATION"
    if [ -d ".git" ]; then
        git pull
        echo "Pulled latest changes from $REPO_LOC"
    else
        git clone -q "$REPO_LOC" "$DESTINATION"
        echo "Cloned $REPO_LOC to $DESTINATION"
    fi
else
    git clone -q "$REPO_LOC" "$DESTINATION"
    echo "Cloned $REPO_LOC to $DESTINATION"
fi
