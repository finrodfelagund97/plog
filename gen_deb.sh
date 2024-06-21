#! /bin/bash

export PACKAGE_NAME="libplog-dev"
export VERSION="1.1.10"

export SRC_ROOT_DIR=$(dirname $(readlink -f ${0}))
export PACK_DIR="${SRC_ROOT_DIR}/debian/usr/local"

rm -rf $PACK_DIR
mkdir -p $PACK_DIR

cd "${SRC_ROOT_DIR}/build"
cmake -DCMAKE_INSTALL_PREFIX=$PACK_DIR ..
cmake --build .
cmake --install .

cd "${SRC_ROOT_DIR}"

dpkg-deb --build debian $PACKAGE_NAME-${VERSION}.deb

