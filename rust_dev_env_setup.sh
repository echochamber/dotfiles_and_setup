# Sets up a rust development environment by:
# * Installing multirust
# * Installing racer
# * Adding environment variables

sudo curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
multirust default nightly

rust_external_path ="$HOME/Code/rust/external_stuff/"

if [ ! -d "$rust_external_path" ] then
    mkdir -p "$rust_external_path"
fi

if [ ! -d "$rust_external_path/rustlang" ] then
    git clone https://github.com/rust-lang/rust "$rust_external_path/rustlang"
fi

if [ ! -d "$rust_external_path/racer" ] then
    git clone https://github.com/phildawes/racer "$rust_external_path/racer"
fi

echo "export RUST_SRC_PATH=\"$rust_external_path/rustlang/src\"" >> $HOME/.profile
. "$HOME/.profile"
