echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

mkdir -p $LFS/sources

for f in $(cat $DIST_ROOT/build_env/build_env_list)
do
    bn=$(basename $f)
    
    if ! test -f $LFS/sources/$bn ; then
        wget $f -O $LFS/sources/$bn
    fi
done;

mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var,tools}
case $(uname -m) in
    x86_64) mkdir -pv $LFS/lib64 ;;
esac

if ! test $(id -u cbuild) ; then
groupadd cbuild
useradd -s /bin/bash -g cbuild -m -k /dev/null cbuild
passwd cbuild
chown -v cbuild $LFS/{usr,lib,var,etc,bin,sbin,tools,sources}

case $(uname -m) in
    x86_64) chown -v cbuild $LFS/lib64 ;;
esac

dbhome=$(eval echo "~cbuild")
cat > $dbhome/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > $dbhome/.bashrc << EOF
set +h
umask 022
LFS=$LFS
DIST_ROOT=$DIST_ROOT
EOF

cat >> $dbhome/.bashrc << "EOF"
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
export MAKEFLAGS="-j$(nproc)"
EOF

fi

## su - cbuild