# ccolor





# Build

## RPM

```

mkdir -p packaging/rpmbuild/SOURCES
cp bin/ccolor packaging/rpmbuild/SOURCES/

rpmbuild --define packaging/rpmbuild/ -ba packaging/rpmbuild/SPECS/ccolor.spec
```


## Debian

### Build
```
sudo apt install build-essential debhelper

cd packaging; dpkg-buildpackage -A -us -uc
```

### Local Install
```
cp ccolor_0.1.0-1_all.deb /tmp/
sudo apt install /tmp/ccolor_0.1.0-1_all.deb
```




