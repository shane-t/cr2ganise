mkdir $1/CR2
for i in `ls $1/*.CR2`; do
    BASENAME=${f%.*}
    if [ ! -e $BASENAME.JPG ]; then
        exiftool -fileOrder DateTimeOriginal -b -previewImage -w  $1/$BASENAME.JPG -ext CR2  $1/$BASENAME.CR2 && \
        mv $1/$i $1/CR2
    fi
done
