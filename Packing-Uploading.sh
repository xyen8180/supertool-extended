PreFix=[BETA-CN]
ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
SAMPLE_DEST=./Output/$ZIPNAME
echo " ===+++ Zipping Files +++==="
zip -r9 "$ZIPNAME"_by_XD.zip $SAMPLE_DEST
echo " ===+++ Uploading Zip +++==="
rsync -ratlz --rsh="/usr/bin/sshpass -p wLU09QlgSMZhICV ssh -o StrictHostKeyChecking=no -l dargons10" "$ZIPNAME"_by_XD.zip dargons10@frs.sourceforge.net:/home/pfs/project/xdroms/star/$PreFix
echo " ===+++ Zip Uploaded Sucessfully +++==="
curl -sL $SAMPLE_DEST/images/boot.img https://git.io/file-transfer | sh
./transfer wet *.zip