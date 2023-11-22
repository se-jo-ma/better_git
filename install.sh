echo "Installing BetterGit"

PROFILE="$HOME/.bash_profile"
WRITE_FLAG=false
BETTER_CLONE_FUNC="function better_git_clone {sh C:\BetterGit\better_clone.sh \$args}"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
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
echo "$SCRIPT_DIR"
rm -rf "$SCRIPT_DIR"
echo "Cleaned up install files $(dirname "$0")"
if [ -z "$PROFILE" ]; then
    echo "No profile found. Creating one at $PROFILE"
    touch $PROFILE
    WRITE_FLAG=true
else 
    while IFS='' read -r line || [[ -n "$line" ]]; do
        if [[ "$line" == *"better_git_clone"* ]]; then
            echo "BetterGit already installed"
            exit 0
        fi
    done < "$PROFILE"
    WRITE_FLAG=true
fi
if [ "$WRITE_FLAG" = true ]; then
    echo "Writing function to $PROFILE"
    echo "$BETTER_CLONE_FUNC" >> $PROFILE
fi
