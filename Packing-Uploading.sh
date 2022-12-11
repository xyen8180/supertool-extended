PreFix=[ROM]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
sudo apt-get -y install sshpass
sudo apt install p7zip rar -y
echo " ===+++ Zipping Files +++==="
zip -r9 [BOOT]"$ZIPNAME"_by_XYEN.zip $SAMPLE_DEST/images/boot.img
rar a -v4G ./Output/[ROM]"$ZIPNAME"_by_XYEN $SAMPLE_DEST/*
ls ./Output
rm -rf $SAMPLE_DEST
ls ./Output
echo " ===+++ Uploading Zip +++==="
curl -sL [BOOT]"$ZIPNAME"_by_XYEN.zip https://git.io/file-transfer | sh
./transfer wet [BOOT]"$ZIPNAME"_by_XYEN.zip
rsync -ratlz --rsh="/usr/bin/sshpass -p Sourceforge*8180 ssh -o StrictHostKeyChecking=no -l xyen8180" ./Output/* xyen8180@frs.sourceforge.net:/home/frs/project/xyen-roms/star
echo " ===+++ Zip Uploaded Sucessfully +++==="
