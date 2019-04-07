echo "Use this script inside folder containing only target files."
echo "We will append .custom in the end of each file name"
read -p "Proceed...? <enter/ctrl+c>"
sudo mkdir temp backup
sudo cp -r ./* ./Backup/
echo "creating backup..."
for f in $(ls -p | grep -v /);
do
    filename=$f;
    mv $filename temp/$filename.custom;
done
mv temp/* ./
echo "done."
echo "You can manually delete backup folder."
