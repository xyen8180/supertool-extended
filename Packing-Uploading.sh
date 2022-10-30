PreFix=[ROM]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
sudo apt-get -y install sshpass
sudo apt install p7zip
echo " ===+++ Zipping Files +++==="
zip -r9 [BOOT]"$ZIPNAME"_by_XYEN.zip $SAMPLE_DEST/images/boot.img
7z a -t7z [ROM]"$ZIPNAME"_by_XYEN.7z $SAMPLE_DEST/*
echo " ===+++ Uploading Zip +++==="
curl -sL [BOOT]"$ZIPNAME"_by_XYEN.zip https://git.io/file-transfer | sh
./transfer wet [BOOT]"$ZIPNAME"_by_XYEN.zip
rsync -ratlz --rsh="/usr/bin/sshpass -p Sourceforge*8180 ssh -o StrictHostKeyChecking=no -l xyen8180" [ROM]"$ZIPNAME"_by_XYEN.7z xyen8180@frs.sourceforge.net:/home/frs/project/xyen-roms/star
echo " ===+++ Zip Uploaded Sucessfully +++==="