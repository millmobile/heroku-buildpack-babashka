#!/usr/bin/env bash

export_env_dir() {
    local env_dir=$1
    if [ -d "$env_dir" ]; then
        local whitelist_regex=${2:-''}
        local blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
        if [ -d "$env_dir" ]; then
            for e in $(ls $env_dir); do
                echo "$e" | grep -E "$whitelist_regex" | grep -qvE "$blacklist_regex" &&
                    export "$e=$(cat $env_dir/$e)"
                :
            done
        fi
    fi
}

write_export() {
    local bp_dir="$1"
    local build_dir="$2"
    echo "export PATH=\"$build_dir/.heroku/babashka/bin:\$PATH\"" > $bp_dir/export
}

write_profile() {
    local build_dir="$1"
    echo "export PATH=\"$HOME/.heroku/babashka/bin:$PATH\"" > $build_dir/.profile.d/buildpack-babashka.sh
}

# Local Variables:
# mode: bash-ts
# End:
