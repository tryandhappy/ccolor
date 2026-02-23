# ccolor



# Options

|Option|Description|
|----|----|
|-i|Case insensitive.|
|-l|Font color Light, Backgroup color Dark.|
|-d|Font color Dark, Backgroup color Ligit.|

|Font|Background|Color|
|----|----|----|
|-k|-0|Black|
|-r|-1|Red|
|-g|-2|Green|
|-y|-3|Yellow|
|-p|-4|Purple|
|-m|-5|Magenta|
|-c|-6|Cyan|
|-w|-7|White|


## Default value when the argument in not specified

```
ccolor \
  -r Fatal Critical Alert Alart Exception Crash Abort Failed Panic Corrupt Overflow Underflow Invalid \
  -m Caution Deprecated Timeout Denied Refused Unauthorized Forbidden Unavailable Disconnect Reset Unexpected Broken
```




# Usage

## Simple Sample

```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor AAA
```
![sample1](docs/images/sample1.png)


```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor AAA BBB CCC DDD EEE FFF
```
![sample2](docs/images/sample2.png)


```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor AA BB CC DD EE FF
```
![sample3](docs/images/sample3.png)


## Color Sample

### Light(default)/Dark Color
```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -l AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -d AA BB CC DD EE FF
```
![sample4](docs/images/sample4.png)


### Colors
```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -r AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -g AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -b AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -p AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -c AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -w AA BB CC DD EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -k AA BB CC DD EE FF
```
![sample5](docs/images/sample5.png)


```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -r AA BB -g CC DD -b EE FF
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -r AA -g BB -b CC -p DD -c EE -k FF -w GG
```
![sample6](docs/images/sample6.png)



### Regex
```
$ echo "AAA BBB CCC DDD EEE FFF GGG" | ccolor -r /A+/ -g /B+/ -b /C[C]/ -p /DDD?/ -c /EE*/
```
![sample7](docs/images/sample7.png)





# Install

## RPM Install
```
yum install https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor-0.1.2-1.noarch.rpm
```
```
dnf install https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor-0.1.2-1.noarch.rpm
```


## Debian/Ubuntu Install
```
wget https://github.com/tryandhappy/ccolor/releases/download/v0.1.0/ccolor_0.1.2-1_all.deb
apt install ./ccolor_0.1.2-1_all.deb
```


## General Linux
```
wget -O /usr/bin/ccolor https://github.com/tryandhappy/ccolor/releases/download/v0.1.2/ccolor
```





# Build

## RPM Build

```
mkdir -p packaging/rpmbuild/SOURCES
cp bin/ccolor packaging/rpmbuild/SOURCES/

cd packaging
./rpmbuild.sh
```


## Debian/Ubuntu Build

### Build
```
sudo apt install build-essential debhelper

cd packaging
./debian.sh
```

### Local Install
```
cp ccolor_0.1.0-1_all.deb /tmp/
sudo apt install /tmp/ccolor_0.1.2-1_all.deb
```
```
sudo dpkg -i ccolor_0.1.2-1_all.deb
```



