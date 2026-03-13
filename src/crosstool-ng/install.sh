set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/apt-packages:1" \
    --option packages="git" \
    --option clean_ppas=true \
    --option preserve_apt_list=true

tmpdir=$(mktemp -d)
git clone --branch $VERSION $REPO_URL $tmpdir
cd $tmpdir
./bootstrap
./configure --prefix=/usr/local
make && make install
cd -
rm -rf $tmpdir
apt remove -y git
apt autoremove -y
