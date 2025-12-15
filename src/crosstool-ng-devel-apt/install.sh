set -e

. ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-extra/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations,
# and if missing - will download a temporary copy that automatically get deleted at the end
# of the script
ensure_nanolayer nanolayer_location "v0.5.0"

crosstool_ng_devel_deps="build-essential,curl,ca-certificates,automake,autoconf,flex,bison,texinfo,help2man,file,gawk,libtool-bin"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-extra/features/apt-packages:1" \
    --option packages="${crosstool_ng_devel_deps}" \
    --option clean_ppas=true \
    --option preserve_apt_list=true

echo 'Done!'
