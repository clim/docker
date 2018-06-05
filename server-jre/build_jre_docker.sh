#!/usr/bin/env bash

VERSION=8u161-b12
FILE=server-jre-8u161-linux-x64.tar.gz

if [ ! -f $FILE ];
then
  echo "Downloading JRE version ${VERSION}..."

  curl --fail --location --retry 3 --header "Cookie: oraclelicense=accept-securebackup-cookie; " \
     http://download.oracle.com/otn-pub/java/jdk/$VERSION/2f38c3b165be4555a1fa6e98c45e0808/$FILE -o $FILE
fi

echo "Building docker image..."

docker build --tag yopep/server-jre:1.8 .

