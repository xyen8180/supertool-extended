PreFix=[BETA-CN]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
sudo apt-get -y install sshpass
echo " ===+++ Zipping Files +++==="
zip -r9 [BETA-CN]"$ZIPNAME"_by_XD.zip $SAMPLE_DEST
echo " ===+++ Uploading Zip +++==="
rsync -ratlz --rsh="/usr/bin/sshpass -p wLU09QlgSMZhICV ssh -o StrictHostKeyChecking=no -l dargons10" [BETA-CN]"$ZIPNAME"_by_XD.zip dargons10@frs.sourceforge.net:/home/pfs/project/xdroms/star
echo " ===+++ Zip Uploaded Sucessfully +++==="