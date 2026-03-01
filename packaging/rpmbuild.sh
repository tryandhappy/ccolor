#!/bin/bash

VERSION=$(cat VERSION)

mkdir -p rpmbuild/SOURCES
cp ../bin/ccolor rpmbuild/SOURCES/

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
    done < CHANGELOG
}

# テンプレートから spec を生成（CHANGELOG 埋め込み）
SPEC_IN=rpmbuild/SPECS/ccolor.spec.in
SPEC=rpmbuild/SPECS/ccolor.spec
RPM_CHANGELOG=$(gen_rpm_changelog)
sed "/@CHANGELOG@/{
r /dev/stdin
d
}" "$SPEC_IN" <<< "$RPM_CHANGELOG" > "$SPEC"

rpmbuild --define "_topdir $(pwd)/rpmbuild" --define "pkg_ver ${VERSION}" -ba "$SPEC"

cp -f rpmbuild/RPMS/noarch/ccolor-*.noarch.rpm ./
cp -f ccolor-*.noarch.rpm ./ccolor.noarch.rpm

