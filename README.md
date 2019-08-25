# meta-tanowrt-rpi

OpenEmbedded layer for supporting Raspberry Pi boards for [TanoWrt](https://github.com/tano-systems/meta-tanowrt) Linux distribution by Tano Systems.

This layer uses fragments from the [meta-raspberrypi](http://git.yoctoproject.org/cgit.cgi/meta-raspberrypi) layer.

## Supported Hardware

| `MACHINE` | Board(s)                   |
| --------- | -------------------------- |
| `rpi3`    | Raspberry Pi 3 Model B/B+  |


## Getting Started

Install the required packages by executing the following commands depending on your distribution.

### Ubuntu and Debian

```shell
sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping
```
### Fedora

```shell
sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
     ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
     python3-pexpect findutils which file cpio python python3-pip xz
```

### openSUSE

```shell
sudo zypper install python gcc gcc-c++ git chrpath make wget python-xml \
     diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
     python3-pexpect xz which
```

### CentOS

```shell
sudo yum install -y epel-release
sudo yum makecache
sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
     diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
     perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python34-pip xz \
     which SDL-devel xterm
```

## Initialize Build Environment

Clone openembedded-core repository:
```shell
git clone -b warrior git://github.com/openembedded/openembedded-core.git
```

Go to the openembedded-core repository directory and clone repositories for bitbake and other dependent layers:
```shell
cd openembedded-core
git clone -b 1.42 git://github.com/openembedded/bitbake.git
git clone -b warrior git://github.com/openembedded/meta-openembedded.git
git clone -b warrior git://git.yoctoproject.org/meta-raspberrypi
git clone -b warrior git://github.com/tano-systems/meta-tanowrt-rpi.git
git clone -b warrior git://github.com/tano-systems/meta-tanowrt.git
```

The first time you need to add layers and create local.conf from the template. To do this, run the command:
```shell
TEMPLATECONF=meta-tanowrt-rpi/conf . ./oe-init-build-env
```

This command automatically creates a `build` subfolder with the required configuration (`local.conf` and `bblayers.conf`) based on the specified template.

If the `build` subfolder with configuration has already been created, this command can be used to initialize build environment:
```shell
. ./oe-init-build-env
```

After executing any of the specified commands, the current directory will be automatically changed to `build` subfolder. Any build commands must be run from the `build` subfolder.

## Building

Build SD card image for Raspberry Pi 3 Model B or B+ board as an example:

```shell
MACHINE=rpi3 bitbake openwrt-image-full
```

When the build is complete, the SD card image file will be located in folder
```
./openwrt-glibc/deploy/images/rpi3/openwrt-image-full-rpi3.sdcard.img
```

## Running on Hardware

Use the `dd` utility to write the generated `.sdcard.img` image to the SD card.
Insert the SD card into the slot on the Raspberry Pi board and turn it on.

## Limitations

Works with OE Release 2.7 (Warrior).

## Dependencies

### openembedded-core
URI: <git://git.openembedded.org/openembedded-core.git>  
Subdirectory: meta  
Branch: warrior  
Revision: 952bfcc3f4b9ee5ba584da0f991f95e80654355a

### meta-tanowrt
URI: <https://github.com/tano-systems/meta-tanowrt>  
Branch: master  
Revision: HEAD

### meta-raspberrypi
URI: <git://git.yoctoproject.org/meta-raspberrypi>  
Branch: warrior  
Revision: b48cc66703edbc2181282d1a666733b4c98dd286

### meta-openembedded
URI: <git://git.openembedded.org/meta-openembedded.git>  
Subdirectory: meta-oe  
Branch: warrior  
Revision: 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0

### meta-networking
URI: <git://git.openembedded.org/meta-openembedded.git>  
Subdirectory: meta-networking  
Branch: warrior  
Revision: 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0

### meta-multimedia
URI: <git://git.openembedded.org/meta-openembedded.git>  
Subdirectory: meta-multimedia  
Branch: warrior  
Revision: 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0

### meta-python
URI: <git://git.openembedded.org/meta-openembedded.git>  
Subdirectory: meta-python  
Branch: warrior  
Revision: 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0

### meta-filesystems
URI: <git://git.openembedded.org/meta-openembedded.git>  
Subdirectory: meta-filesystems  
Branch: warrior  
Revision: 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0

### bitbake
URI: <git://git.openembedded.org/bitbake>  
Branch: 1.42  
Revision: 34ed28a412af642a993642c14bd8b95d5ef22cd8

## License

All metadata is MIT licensed unless otherwise stated. Source code included in tree for individual recipes is under the LICENSE stated in each recipe (.bb file) unless otherwise stated.

## Maintainers

Anton Kikin <a.kikin@tano-systems.com>
