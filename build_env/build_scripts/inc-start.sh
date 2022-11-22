FILE=$1
DIR=$(echo $FILE | awk -F"\\\\.t" '{print $1}')

echo 
echo "Processing $FILE"
echo
sleep 1

cd $LFS/sources
echo "Extracting..."
tar -xf $FILE
cd $DIR
echo "Changed to build path"