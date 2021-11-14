ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
chmod u+x *
chmod u+x ./Binaries/*
echo " ===+++ Calculating Size of the Images +++==="
OD=$(stat -c %s $SAMPLE_DEST/images/odm.img)
echo "ODM=$OD"
PR=$(stat -c %s $SAMPLE_DEST/images/product.img)
echo "PRODUCT=$PR"
SY=$(stat -c %s $SAMPLE_DEST/images/system.img)
echo "SYSTEM=$SY"
SE=$(stat -c %s $SAMPLE_DEST/images/system_ext.img)
echo "SYSTEM_EXT=$SE"
VE=$(stat -c %s $SAMPLE_DEST/images/vendor.img)
echo "VENDOR=$VE"
SUM=`expr $OD + $PR + $SY + $SE + $VE`
echo "All=$SUM"
echo " ===+++ Building SuperImage Please Wait +++==="
./Binaries/lpmake --device-size 9126805504 --metadata-size 65536 --metadata-slots 3 --super-name super  --group qti_dynamic_partitions:$SUM --partition system_a:readonly:$SY:qti_dynamic_partitions --partition system_b:readonly:0:qti_dynamic_partitions --partition system_ext_a:readonly:$SE:qti_dynamic_partitions --partition system_ext_b:readonly:0:qti_dynamic_partitions --partition vendor_a:readonly:$VE:qti_dynamic_partitions --partition vendor_b:readonly:0:qti_dynamic_partitions --partition product_a:readonly:$PR:qti_dynamic_partitions --partition product_b:readonly:0:qti_dynamic_partitions --partition odm_a:readonly:$OD:qti_dynamic_partitions --partition odm_b:readonly:0:qti_dynamic_partitions --image system_a=$SAMPLE_DEST/images/system.img --image system_ext_a=$SAMPLE_DEST/images/system_ext.img --image vendor_a=$SAMPLE_DEST/images/vendor.img --image product_a=$SAMPLE_DEST/images/product.img --image odm_a=$SAMPLE_DEST/images/odm.img --virtual-ab --sparse --output $SAMPLE_DEST/images/super.img
echo " ===+++ SuperImage is Built Sucessfully +++==="
echo " ===+++ Removing Unnecessary Files +++==="
rm $SAMPLE_DEST/images/odm.img $SAMPLE_DEST/images/product.img $SAMPLE_DEST/images/system.img $SAMPLE_DEST/images/system_ext.img $SAMPLE_DEST/images/vendor.img