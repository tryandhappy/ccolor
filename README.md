# ccolor




# Usage

## Sample
<pre style="background:black; color:white; padding:10px;">
$ echo "AAA BBB CCC DDD EEE" | ccolor BBB DDD
AAA <span style="color:#FF0000">BBB</span> CCC <span style="color:$00FF00">DDD</span> EEE
</pre>




# Install

## RPM Install
```
yum install https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor-0.1.0-1.noarch.rpm
```
```
dnf install https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor-0.1.0-1.noarch.rpm
```


## Debian/Ubuntu Install
```
wget https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor_0.1.0-1_all.deb
apt install ./ccolor_0.1.0-1_all.deb
```






# Build

## RPM Build

```

mkdir -p packaging/rpmbuild/SOURCES
cp bin/ccolor packaging/rpmbuild/SOURCES/

rpmbuild --define packaging/rpmbuild/ -ba packaging/rpmbuild/SPECS/ccolor.spec
```


## Debian/Ubuntu Build

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




