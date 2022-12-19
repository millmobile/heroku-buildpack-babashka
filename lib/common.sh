#!/usr/bin/env bash

install_babashka() {
    local build_dir="$1"
    echo "-----> Installing latest Babashka"
    mkdir -p $build_dir/.heroku/babashka/bin
    curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
    chmod +x install
    ./install --dir $build_dir/.heroku/babashka/bin
    chmod +x $build_dir/.heroku/babashka/bin/bb
    export PATH=$build_dir/.heroku/babashka/bin:$PATH

    echo "-----> Check babashka installation"
    bb version
}

# Local Variables:
# mode: bash-ts
# End:
