ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
chmod u+x *
chmod u+x ./Binaries/*
echo " ===+++ Processing Payload +++==="
./Binaries/payload -o $SAMPLE_DEST/images/ payload.bin
rm payload.bin