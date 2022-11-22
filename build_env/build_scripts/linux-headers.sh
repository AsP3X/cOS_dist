BUILD_ARCHIVE=linux-5.19.2.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

make mrproper

make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE