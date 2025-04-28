#!/bin/bash

IGNORED_PATHS=("./directory1" "./directory2")

is_ignored() {
    local path="$1"
    for ignored in "${IGNORED_PATHS[@]}"; do
        if [[ "$path" == *"$ignored"* ]]; then
            return 0
        fi
    done
    return 1
}

find . -type f \( -name "compose.yml" \) | while read -r file; do
    dir=$(dirname "$file")

    if is_ignored "$dir"; then
        echo "🚫 Ignoring $dir"
        continue
    fi

    echo "🚀 Starting services in $dir"
    (cd "$dir" && docker compose up -d)
done
