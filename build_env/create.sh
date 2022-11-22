echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

if ! test $(whoami) == "cbuild" ; then
    echo "Must use the correct user -> cbuild"
    exit -1
fi

echo "Creating build environment..."