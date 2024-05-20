#!/bin/bash

BASE=curl
VERSION=8.7.1
EXT=tar.gz
filename=$BASE-$VERSION.$EXT
extracted=$BASE-$VERSION
download_folder=download
third_party_curl_folder=third_party/$BASE-$VERSION

OPTIONS="--with-openssl
        --enable-http 
        --enable-telnet 
        --disable-ftp   
        --disable-file 
        --disable-ldap  
        --disable-ldaps  
        --disable-rtsp   
        --disable-proxy   
        --disable-dict  
        --disable-tftp  
        --disable-pop3    
        --disable-imap  
        --disable-smb 
        --disable-smtp 
        --disable-gopher  
        --disable-mqtt  
        --disable-docs
        --disable-manual"


mkdir -p $download_folder $third_party_curl_folder


cd $download_folder

count=$(ls | wc -l)


if [ $count -lt 1 ]; then 
    echo Empty, downloading...
    wget https://curl.se/download/$filename

    echo Extracting...
    tar -zxf $filename

else
    echo File is already extracted and downloaded, going forward    
fi

echo Moving to curl folder
cd $extracted
echo `pwd`


./configure --prefix=$(pwd)/../../$third_party_curl_folder $OPTIONS
make
make install -j



