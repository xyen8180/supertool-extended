SAMPLE=./Sample/MiUi_STAR_21.10.13_by_XD.zip
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
chmod u+x *
chmod u+x ./Binaries/*
echo " ===+++ Unziping Sample +++==="
unzip $SAMPLE -d $SAMPLE_DEST
echo " ===+++ Unziping Payload +++==="
unzip ./Input/*.zip payload.bin