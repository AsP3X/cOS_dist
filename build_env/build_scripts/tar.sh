BUILD_ARCHIVE=tar-1.34.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE