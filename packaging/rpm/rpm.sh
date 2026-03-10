#!/bin/bash

cd "$(dirname "$0")"

VERSION=$(cat ../VERSION)
TOPDIR="$(pwd)"

mkdir -p SOURCES BUILD RPMS SRPMS ../build
cp ../../bin/ccolor SOURCES/

# CHANGELOG から RPM 形式の changelog を生成
gen_rpm_changelog() {
    while IFS= read -r line; do
        if [[ "$line" =~ ^\*\ ([0-9][^ ]+)\ ([0-9]{4}-[0-9]{2}-[0-9]{2})\ (.+) ]]; then
            ver="${BASH_REMATCH[1]}"
            datestr="${BASH_REMATCH[2]}"
            maintainer="${BASH_REMATCH[3]}"
            rpm_date=$(date -d "$datestr" "+%a %b %d %Y")
            echo "* ${rpm_date} ${maintainer} - ${ver}"
        elif [[ -n "$line" ]]; then
            echo "$line"
        else
            echo ""
        fi
    done < ../CHANGELOG
}

# テンプレートから spec を生成（CHANGELOG 埋め込み）
SPEC_IN=SPECS/ccolor.spec.in
SPEC=SPECS/ccolor.spec
RPM_CHANGELOG=$(gen_rpm_changelog)
sed "/@CHANGELOG@/{
r /dev/stdin
d
}" "$SPEC_IN" <<< "$RPM_CHANGELOG" > "$SPEC"

rpmbuild --define "_topdir ${TOPDIR}" --define "pkg_ver ${VERSION}" -ba "$SPEC"

mv -f RPMS/noarch/ccolor-${VERSION}-1.noarch.rpm ../build/
cp -f ../build/ccolor-${VERSION}-1.noarch.rpm ../build/ccolor.noarch.rpm
