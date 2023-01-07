ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
PAYLOAD_OUTPUT=$SAMPLE_DEST/images
chmod u+x *
chmod u+x ./Binaries/*
echo " ===+++ Calculating Size of the Images +++==="
ls $PAYLOAD_OUTPUT
MI_EXT=$(stat -c %s $PAYLOAD_OUTPUT/mi_ext.img)
echo "MI_EXT=$MI_EXT"
OD=$(stat -c %s $PAYLOAD_OUTPUT/odm.img)
echo "ODM=$OD"
PR=$(stat -c %s $PAYLOAD_OUTPUT/product.img)
echo "PRODUCT=$PR"
SY=$(stat -c %s $PAYLOAD_OUTPUT/system.img)
echo "SYSTEM=$SY"
SE=$(stat -c %s $PAYLOAD_OUTPUT/system_ext.img)
echo "SYSTEM_EXT=$SE"
VE=$(stat -c %s $PAYLOAD_OUTPUT/vendor.img)
echo "VENDOR=$VE"
SUM=`expr $OD + $PR + $SY + $SE + $VE + $MI_EXT`
echo "All=$SUM"
echo " ===+++ Building SuperImage Please Wait +++==="
MI_EXT=$(stat -c %s $PAYLOAD_OUTPUT/mi_ext.img)
echo "MI_EXT=$MI_EXT"
OD=$(stat -c %s $PAYLOAD_OUTPUT/odm.img)
echo "ODM=$OD"
PR=$(stat -c %s $PAYLOAD_OUTPUT/product.img)
echo "PRODUCT=$PR"
SY=$(stat -c %s $PAYLOAD_OUTPUT/system.img)
echo "SYSTEM=$SY"
SE=$(stat -c %s $PAYLOAD_OUTPUT/system_ext.img)
echo "SYSTEM_EXT=$SE"
VE=$(stat -c %s $PAYLOAD_OUTPUT/vendor.img)
echo "VENDOR=$VE"
VD=$(stat -c %s $PAYLOAD_OUTPUT/vendor_dlkm.img)
echo "VENDOR_DLKM=$VD"
SUM=`expr $OD + $PR + $SY + $SE + $VE + $VD + $MI_EXT`
echo "All=$SUM"
echo "Building super image please wait..."
./Binaries/lpmake \
--device-size=9126805504 \
--metadata-size 65536 \
--metadata-slots=3 \
--group=qti_dynamic_partitions_a:$SUM \
--partition=mi_ext_a:readonly:$MI_EXT:qti_dynamic_partitions_a \
--partition=odm_a:readonly:$OD:qti_dynamic_partitions_a \
--partition=product_a:readonly:$PR:qti_dynamic_partitions_a \
--partition=system_a:readonly:$SY:qti_dynamic_partitions_a \
--partition=system_ext_a:readonly:$SE:qti_dynamic_partitions_a \
--partition=vendor_a:readonly:$VE:qti_dynamic_partitions_a \
--partition=vendor_dlkm_a:readonly:$VD:qti_dynamic_partitions_a \
--image=mi_ext_a=$PAYLOAD_OUTPUT/mi_ext.img \
--image=odm_a=$PAYLOAD_OUTPUT/odm.img \
--image=product_a=$PAYLOAD_OUTPUT/product.img \
--image=system_a=$PAYLOAD_OUTPUT/system.img \
--image=system_ext_a=$PAYLOAD_OUTPUT/system_ext.img \
--image=vendor_a=$PAYLOAD_OUTPUT/vendor.img \
--image=vendor_dlkm_a=$PAYLOAD_OUTPUT/vendor_dlkm.img \
--group=qti_dynamic_partitions_b:$SUM \
--partition=mi_ext_b:readonly:0:qti_dynamic_partitions_b \
--partition=odm_b:readonly:0:qti_dynamic_partitions_b \
--partition=product_b:readonly:0:qti_dynamic_partitions_b \
--partition=system_b:readonly:0:qti_dynamic_partitions_b \
--partition=system_ext_b:readonly:0:qti_dynamic_partitions_b \
--partition=vendor_b:readonly:0:qti_dynamic_partitions_b \
--partition=vendor_dlkm_b:readonly:0:qti_dynamic_partitions_b \
--image=mi_ext_b=$PAYLOAD_OUTPUT/mi_ext_b.img \
--image=odm_b=$PAYLOAD_OUTPUT/odm_b.img \
--image=product_b=$PAYLOAD_OUTPUT/product_b.img \
--image=system_b=$PAYLOAD_OUTPUT/system_b.img \
--image=system_ext_b=$PAYLOAD_OUTPUT/system_ext_b.img \
--image=vendor_b=$PAYLOAD_OUTPUT/vendor_b.img \
--sparse \
--virtual-ab \
--output $PAYLOAD_OUTPUT/super.img
echo " ===+++ SuperImage is Built Sucessfully +++==="
echo " ===+++ Removing Unnecessary Files +++==="
rm \
$PAYLOAD_OUTPUT/mi_ext.img \
$PAYLOAD_OUTPUT/odm.img \
$PAYLOAD_OUTPUT/product.img \
$PAYLOAD_OUTPUT/system.img \
$PAYLOAD_OUTPUT/system_ext.img \
$PAYLOAD_OUTPUT/vendor.img \
$PAYLOAD_OUTPUT/mi_ext_b.img \
$PAYLOAD_OUTPUT/odm_b.img \
$PAYLOAD_OUTPUT/product_b.img \
$PAYLOAD_OUTPUT/system_b.img \
$PAYLOAD_OUTPUT/system_ext_b.img \
$PAYLOAD_OUTPUT/vendor_b.img
