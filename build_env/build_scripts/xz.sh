BUILD_ARCHIVE=xz-5.2.6.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.6

make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE