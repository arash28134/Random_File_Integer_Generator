
read -p "Enter random file's name(Without it's extension and only .txt files!): " FILE_NAME
read -p "Enter random file's size in kb: " FILE_SIZE
pwd=`pwd`
if [ ! -e $FILE_NAME.txt ]
then
  touch $FILE_NAME.txt
  dd if=/dev/random of=$pwd/$FILE_NAME.txt bs=1024 count=$FILE_SIZE
  echo
  echo
  echo "<<<<<<<<  OPERATION DONE  >>>>>>>>"
  echo
else
  if [ -s $FILE_NAME.txt ]
  then
    read -p "The file you entered already has content in it, are you sure you want to fill it with random integers?(y OR n): " USER_PERMISSION
    if [ "$USER_PERMISSION" = "y" ]
    then
      echo
      dd if=/dev/random of=$pwd/$FILE_NAME.txt bs=1024 count=$FILE_SIZE
      echo
      echo
      echo "<<<<<<<<  OPERATION DONE  >>>>>>>>"
      echo
    else
      echo "<<<<<<<<  OPERATION ABORTED  >>>>>>>>"
      echo
    fi  
  else
    echo
    dd if=/dev/random of=$pwd/$FILE_NAME.txt bs=1024 count=$FILE_SIZE
    echo
    echo
    echo "<<<<<<<<  OPERATION DONE  >>>>>>>>"
    echo
  fi  
fi