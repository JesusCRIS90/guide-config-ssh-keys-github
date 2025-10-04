# Exit on error
set -e

# Check if parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <given-name>"
  exit 1
fi

NAME="$1"
KEY_DIR="./keys/$NAME"
KEY_FILE="$KEY_DIR/id_ed25519_$NAME"
KEY_COMMENT="Comment-$NAME"

# STEP 1 - Create folder if it doesn't exist
mkdir -p "$KEY_DIR"

# STEP 2 - Generate SSH Keys => -C Add a comment on the public key. Do not need really
ssh-keygen -t ed25519 -C "$KEY_COMMENT" -f "$KEY_FILE"