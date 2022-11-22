BUILD_ARCHIVE=findutils-4.9.0.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$LFS install

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE