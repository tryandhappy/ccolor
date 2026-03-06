#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PACKAGING_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION=$(cat "$PACKAGING_DIR/VERSION")
PKG_NAME="ccolor"

# CHANGELOG から Debian 形式の changelog を生成
gen_deb_changelog() {
    local ver="" datestr="" maintainer=""
    local entries=()

    flush_entry() {
        if [ -n "$ver" ]; then
            local deb_date=$(LC_ALL=C date -d "$datestr" "+%a, %d %b %Y 00:00:00 +0000")
            echo "${PKG_NAME} (${ver}) unstable; urgency=medium"
            echo ""
            for e in "${entries[@]}"; do
                echo "  $e"
            done
            echo ""
            if [[ "$maintainer" != *"<"*">"* ]]; then
                maintainer="${maintainer} <>"
            fi
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
    done < "$PACKAGING_DIR/CHANGELOG"
    flush_entry
}

gen_deb_changelog > "$SCRIPT_DIR/changelog"

sed -i "s/^Standards-Version: .*/Standards-Version: ${VERSION}/" "$SCRIPT_DIR/control"

cd "$PACKAGING_DIR"
dpkg-buildpackage -us -uc -b

mkdir -p "$PACKAGING_DIR/build"
mv "$PACKAGING_DIR"/../${PKG_NAME}_*.buildinfo "$PACKAGING_DIR/build/" 2>/dev/null
mv "$PACKAGING_DIR"/../${PKG_NAME}_*.changes "$PACKAGING_DIR/build/" 2>/dev/null
mv "$PACKAGING_DIR"/../${PKG_NAME}_*_all.deb "$PACKAGING_DIR/build/" 2>/dev/null
cp -f "$PACKAGING_DIR/build/${PKG_NAME}_${VERSION}-"*_all.deb "$PACKAGING_DIR/build/ccolor_all.deb" 2>/dev/null


