BUILD_ARCHIVE=gzip-1.12.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

./configure --prefix=/usr --host=$LFS_TGT

make
make DESTDIR=$LFS install

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE