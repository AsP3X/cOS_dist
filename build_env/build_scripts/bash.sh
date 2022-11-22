BUILD_ARCHIVE=bash-5.1.16.tar.gz
. $DIST_ROOT/build_env/build_scripts/inc-start.sh $BUILD_ARCHIVE

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

make
make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh

. $DIST_ROOT/build_env/build_scripts/inc-end.sh $BUILD_ARCHIVE
