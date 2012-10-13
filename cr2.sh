WD=`basename $1`
mkdir $WD/CR2
for i in `ls $WD/*.CR2 | xargs -n1 basename`; do
    BASENAME=${i%.*}
    echo $BASENAME
    if [ ! -e $WD/$BASENAME.JPG ]; then
        echo "Converting $WD/$BASENAME.CR2"
        dcraw -c $WD/$BASENAME.CR2 | cjpeg > $WD/$BASENAME.JPG && \
        mv $WD/$BASENAME.CR2 $WD/CR2
    else 
        echo "$BASENAME.JPG exists"
        mv $WD/$BASENAME.CR2 $WD/CR2
    fi
done
