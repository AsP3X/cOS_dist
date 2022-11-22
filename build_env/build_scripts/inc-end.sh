FILE=$1
DIR=$(echo $FILE | awk -F"\\\\.t" '{print $1}')

echo
echo "Cleaning up $DIR"
echo

cd $LFS/sources
rm -rf $DIR

echo
echo "Done Processing $FILE"
echo