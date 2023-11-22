echo "Installing BetterGit"

PROFILE="$HOME/.bash_profile"
BETTER_CLONE_FUNC="{sh C:\BetterGit\better_clone.sh \$args}"
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
if [ ! -n "$INSTALL_DEST\better_clone.sh" ]; then
    echo "No better_clone.sh found. Creating one at $INSTALL_DEST"
    touch $INSTALL_DEST"\better_clone.sh"
fi

echo "Updating $INSTALL_DEST"
cp "$SCRIPT_DIR/better_clone.sh" "$INSTALL_DEST\better_clone.sh"

if [ "$RM_FLAG" = true ]; then
    rm -rf "$SCRIPT_DIR"
    echo "Cleaned up install files $(dirname "$0")"
fi

if [ -z "$PROFILE" ]; then
    echo "No profile found. Creating one at $PROFILE"
    touch $PROFILE
fi
if ! grep -q "function better_git_clone" "$PROFILE"; then
    echo "function better_git_clone $BETTER_CLONE_FUNC" >> "$PROFILE"
    echo "Added better_git_clone function to $PROFILE"
fi

if ! grep -q "function bgc" "$PROFILE"; then
    echo "function bgc $BGC_FUNC" >> "$PROFILE"
    echo "Added bgc function to $PROFILE"
fi
