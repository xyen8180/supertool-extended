PreFix=[BETA-CN]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
sudo apt-get -y install sshpass
sudo apt install p7zip
echo " ===+++ Zipping Files +++==="
zip -r9 [BOOT]"$ZIPNAME"_by_XD.zip $SAMPLE_DEST/images/boot.img
7z a -t7z [BETA-CN]"$ZIPNAME"_by_XD.7z $SAMPLE_DEST/*
echo " ===+++ Uploading Zip +++==="
curl -sL [BOOT]"$ZIPNAME"_by_XD.zip https://git.io/file-transfer | sh
./transfer wet [BOOT]"$ZIPNAME"_by_XD.zip
rsync -ratlz --rsh="/usr/bin/sshpass -p wLU09QlgSMZhICV ssh -o StrictHostKeyChecking=no -l dargons10" [BETA-CN]"$ZIPNAME"_by_XD.7z dargons10@frs.sourceforge.net:/home/pfs/project/xdroms/star
echo " ===+++ Zip Uploaded Sucessfully +++==="