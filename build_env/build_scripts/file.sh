BUILD_ARCHIVE=file-5.42.tar.gz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/libmagic.la

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE
