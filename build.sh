#!/bin/bash

set -e

mkdir -p /build
cd /build
git clone --depth=1 -b v${PRODUCT_VERSION}.${BUILD_NUMBER} --recursive https://github.com/ONLYOFFICE/build_tools.git
git clone --depth=1 -b v${PRODUCT_VERSION}.${BUILD_NUMBER} --recursive https://github.com/ONLYOFFICE/document-server-package.git

cd /build/build_tools/tools/linux
CPUS=$(grep siblings /proc/cpuinfo | uniq |  awk '{print $3}')
sed -i -e '/"-j"/s/"4"/"'$CPUS'"/' automate.py
apt-get update
python3 ./automate.py --branch=tags/v${PRODUCT_VERSION}.${BUILD_NUMBER} server
rm -rf /build/build_tools/{tools,script,develop}
cd /build/document-server-package
make rpm deb
mkdir -p /build/out
find . -name "onlyoffice-documentserver*.rpm" -exec cp {} /build/out/ \;
find . -name "onlyoffice-documentserver*.deb" -exec cp {} /build/out/ \;


