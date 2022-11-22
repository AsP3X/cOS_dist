set -e
echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

if ! test $(whoami) == "cbuild" ; then
    echo "Must use the correct user -> cbuild"
    exit -1
fi

echo "Creating build environment..."
cd $DIST_ROOT/build_env

#bash -e build_scripts/binutils-pass-1.sh
#bash -e build_scripts/gcc-pass-1.sh
#bash -e build_scripts/linux-headers.sh
#bash -e build_scripts/glibc.sh
bash -e build_scripts/libstdcpp-pass-1.sh

echo "DONE!"