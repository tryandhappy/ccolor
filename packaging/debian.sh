#!/bin/bash

PKG_NAME="ccolor"

# CHANGELOG から Debian 形式の changelog を生成
gen_deb_changelog() {
    local ver="" datestr="" maintainer=""
    local entries=()

    flush_entry() {
        if [ -n "$ver" ]; then
            local deb_date=$(date -d "$datestr" "+%a, %d %b %Y 00:00:00 +0000")
            echo "${PKG_NAME} (${ver}) unstable; urgency=medium"
            echo ""
            for e in "${entries[@]}"; do
                echo "  $e"
            done
            echo ""
            echo " -- ${maintainer}  ${deb_date}"
            echo ""
        fi
    }

    while IFS= read -r line; do
        if [[ "$line" =~ ^\*\ ([0-9][^ ]+)\ ([0-9]{4}-[0-9]{2}-[0-9]{2})\ (.+) ]]; then
            flush_entry
            ver="${BASH_REMATCH[1]}"
            datestr="${BASH_REMATCH[2]}"
            maintainer="${BASH_REMATCH[3]}"
            entries=()
        elif [[ "$line" =~ ^-\ (.+) ]]; then
            entries+=("* ${BASH_REMATCH[1]}")
        fi
    done < CHANGELOG
    flush_entry
}

gen_deb_changelog > debian/changelog

dpkg-buildpackage -us -uc -b


cp ../ccolor_*_all.deb ./
cp ./ccolor_*_all.deb ./ccolor_all.deb


