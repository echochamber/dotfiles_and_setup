# Sets up a rust development environment by:
# * Installing multirust
# * Installing racer
# * Adding environment variables


# Path where external rustlang clone will live (for autocomplete purposes)
if [ ! command -v rustc ]
    then
        curl -sSf https://static.rust-lang.org/rustup.sh | sh
fi

rust_external_path="$HOME/Code/external_stuff/rust"

if [ ! -d "$rust_external_path" ]
    then
        mkdir -p "$rust_external_path"
fi

if [ ! -d "$rust_external_path/rustlang" ]
    then
    git clone https://github.com/rust-lang/rust "$rust_external_path/rustlang"
fi

if [ ! command -v racer ]
    then
    cargo install racer
fi

echo "export RUST_SRC_PATH=\"$rust_external_path/rustlang/src\"" >> $HOME/.profile
. "$HOME/.profile"
