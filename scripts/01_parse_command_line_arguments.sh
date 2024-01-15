# shellcheck disable=SC2148

# Function to display usage instructions
usage() {
  echo "Usage: $0 [-b <user_bin_dir>]"
  echo "Options:"
  echo "  -b, --bin  Specify the user-specific bin directory"
  exit 1
}

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -b | --bin)
      shift
      user_bin_dir="$1"
      shift
      ;;
    *)
      usage
      ;;
  esac
done

# If user_bin_dir is not set explicitly, use $PATH method
if [ -z "$user_bin_dir" ]; then
  user_bin_dir=$(echo "$PATH" | tr ':' '\n' | grep '^/home/.*/bin$')

  if [ -z "$user_bin_dir" ]; then
    echo "No matching bin path found in \$PATH."
    exit 1
  elif [ "$(echo "$user_bin_dir" | wc -l)" -ne 1 ]; then
    echo "Ambiguous bin path. Multiple matching paths found in \$PATH:"
    echo "$user_bin_dir"
    exit 1
  fi

  user_bin_dir=$(echo "$user_bin_dir" | head -n 1)
  echo "Using bin directory found in \$PATH: $user_bin_dir"
fi
