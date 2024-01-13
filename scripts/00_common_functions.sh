ORANGE='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

skipped_files=()

success_message() {
    echo -e "${GREEN}$1${NC}"
}

warning_message() {
    echo -e "${ORANGE}Warning: $1${NC}"
}

error_message() {
    echo -e "${RED}$1${NC}"
}

info_message() {
    echo -e "${BLUE}$1${NC}"
}

create_symbolic_link() {
    source_file="$1"
    dest_file="$2"

    if [ -e "$dest_file" ]; then
    	warning_message "'$dest_file' already exists."
        skipped_files+=("$source_file")
    else
        ln -s "$source_file" "$dest_file"
        success_message "Symbolically linked $source_file to $dest_file"
    fi
}