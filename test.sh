# test while loop
echo "test while loop"
while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) echo "workwork" >> temp.txt; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
# test select
#echo "testing select loop"
#echo "Do you wish to install this program?"
#select yn in "Yes" "No"; do
#    case $yn in
#        Yes ) echo "workwork"; break;;
#        No ) exit;;
#    esac
#done
#echo cheesecakes >> temp.txt
