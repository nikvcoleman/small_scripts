clear
echo -e "THIS SCRIPT WILL OVERWRITE A DRIVE SEVEN TIMES WITH RANDOM DATA...BE VERY CAREFUL!!!\n"
sudo fdisk -l
echo -e "\n\n"
echo -n "What disk would you like to over-write? : "
read diskdir
clear
echo "Overwriting $diskdir 7x with random data."
for i in `seq 7`; do sudo dd if=/dev/urandom of=$diskdir bs=1M conv=notrunc status=progress; done
