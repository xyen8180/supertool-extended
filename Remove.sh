ZIPNAME="$(ls ./Input | sed -e 's/\.zip$//')"
echo " ===+++ Removing Source Files +++==="
rm -R Binaries
rm -R Sample
rm -R Output
rm -R Input
rm -R Env.sh
rm -R Fetch.sh
rm -R Unpacking.sh
rm -R Payload.sh
rm -R Super.sh
rm -R transfer
rm -R Packing-Uploading.sh
rm -R [BETA-CN]"$ZIPNAME"_by_XYEN.7z
rm -R [BOOT]"$ZIPNAME"_by_XYEN.zip