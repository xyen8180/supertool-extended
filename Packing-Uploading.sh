PreFix=[BETA-CN]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
sudo apt-get -y install sshpass
echo " ===+++ Zipping Files +++==="
zip -r9 [BOOT]"$ZIPNAME"_by_XD.zip $SAMPLE_DEST/images/boot.img
zip -r9 -s 3900m [BETA-CN]"$ZIPNAME"_by_XD.zip $SAMPLE_DEST
echo " ===+++ Uploading Zip +++==="
rsync -ratlz --rsh="/usr/bin/sshpass -p wLU09QlgSMZhICV ssh -o StrictHostKeyChecking=no -l dargons10" [2]"$ZIPNAME"_by_XD.z01 dargons10@frs.sourceforge.net:/home/pfs/project/xdroms/star
rsync -ratlz --rsh="/usr/bin/sshpass -p wLU09QlgSMZhICV ssh -o StrictHostKeyChecking=no -l dargons10" [1]"$ZIPNAME"_by_XD.zip dargons10@frs.sourceforge.net:/home/pfs/project/xdroms/star
curl -sL [BOOT]"$ZIPNAME"_by_XD.zip https://git.io/file-transfer | sh
./transfer wet [BOOT]"$ZIPNAME"_by_XD.zip
echo " ===+++ Zip Uploaded Sucessfully +++==="
echo "MD5 : $(md5sum [BETA-CN]"$ZIPNAME"_by_XD.zip)"
echo "SHA1 : $(sha1sum [BETA-CN]"$ZIPNAME"_by_XD.zip)"