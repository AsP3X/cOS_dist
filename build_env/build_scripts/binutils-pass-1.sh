BUILD_ARCHIVE=binutils-2.39.tar.xz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

mkdir -v build
cd build

../configure --prefix=$LFS/tools \
    --with-sysroot=$LFS \
    --target=$LFS_TGT \
    --disable-nls \
    --disable-werror

make && make install

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE
