echo "Installing BetterGit"

PROFILE="$HOME/.bash_profile"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
RM_FLAG=false
while getopts "Rr" opt; do
    case $opt in
        r|R)
            RM_FLAG=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done
if [ -n "$1" ]; then
    PROFILE=$1
fi

INSTALL_DEST="C:\BetterGit"
if [ ! -d "$INSTALL_DEST" ]; then
    echo "No install destination found. Creating one at $INSTALL_DEST"
    mkdir $INSTALL_DEST
fi

echo "Updating $INSTALL_DEST"
cp -r "$SCRIPT_DIR/commands" "$INSTALL_DEST"
cp "$SCRIPT_DIR/Profile.ps1" "$INSTALL_DEST\Profile.ps1"

if [ "$RM_FLAG" = true ]; then
    rm -rf "$SCRIPT_DIR"
    echo "Cleaned up install files $(dirname "$0")"
fi

if [ -z "$PROFILE" ]; then
    echo "No profile found. Creating one at $PROFILE"
    touch $PROFILE
fi
if ! grep -q ". C:\BetterGit\Profile.ps1" "$PROFILE"; then
    echo ". C:\BetterGit\Profile.ps1" >> "$PROFILE"
    echo "Added BetterGit Commands to $PROFILE"
fi