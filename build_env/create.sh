set -e
echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

if ! test $(whoami) == "cbuild" ; then
    echo "Must use the correct user -> cbuild"
    exit -1
fi

echo "Creating build environment..."
cd $DIST_ROOT/build_env

# bash -e build_scripts/binutils-pass-1.sh
# bash -e build_scripts/gcc-pass-1.sh
# bash -e build_scripts/linux-headers.sh
# bash -e build_scripts/glibc.sh
# bash -e build_scripts/libstdcpp-pass-1.sh
# bash -e build_scripts/m4.sh
# bash -e build_scripts/ncurse.sh
# bash -e build_scripts/bash.sh
# bash -e build_scripts/coreutils.sh
# bash -e build_scripts/diffutils.sh
# bash -e build_scripts/file.sh #warning: 'libmagic.la' has not been installed in '/usr/lib'
# bash -e build_scripts/findutils.sh
# bash -e build_scripts/gawk.sh #warning: remember to run 'libtool --finish /usr/lib/gawk'
# bash -e build_scripts/grep.sh
# bash -e build_scripts/gzip.sh
# bash -e build_scripts/make.sh
# bash -e build_scripts/patch.sh
# bash -e build_scripts/sed.sh
# bash -e build_scripts/tar.sh
# bash -e build_scripts/xz.sh
bash -e build_scripts/binutils-pass-2.sh
bash -e build_scripts/gcc-pass-2.sh

echo "DONE!"