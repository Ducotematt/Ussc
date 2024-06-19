#!/bin/bash
echo -e "\033[0;32mHow many CPU cores do you want to be used in compiling process? (Default is 1. Press enter for default.)\033[0m"
read -e CPU_CORES
if [ -z "$CPU_CORES" ]
then
    CPU_CORES=1
fi

# Upgrade the system and install required dependencies
	sudo apt update
	sudo apt-get install curl librsvg2-bin libtiff-tools bsdmainutils cmake imagemagick libcap-dev libz-dev libbz2-dev python3-setuptools -y
	
# Compile dependencies
    cd depends
    mkdir SDKs
    cd SDKs
    wget https://bitcoincore.org/depends-sources/sdks/Xcode-11.3.1-11C505-extracted-SDK-with-libcxx-headers.tar.gz
    tar -xf Xcode-11.3.1-11C505-extracted-SDK-with-libcxx-headers.tar.gz
    cd ..
    make -j$(echo $CPU_CORES) HOST=x86_64-apple-darwin17
    cd ..

# Compile
    ./autogen.sh
    ./configure --prefix=$(pwd)/depends/x86_64-apple-darwin17 --enable-cxx --enable-static --disable-shared --disable-debug --disable-tests --disable-bench --disable-online-rust
    make -j$(echo $CPU_CORES) HOST=x86_64-apple-darwin17

# Create zip file of binaries
    cp src/usscd src/ussc-cli src/ussc-tx src/qt/ussc-qt .
    zip USSC-MacOS.zip usscd ussc-cli ussc-tx ussc-qt
    rm -f usscd ussc-cli ussc-tx ussc-qt
    make clean
