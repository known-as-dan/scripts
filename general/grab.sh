if [ "$1" != "" ]
then
	name="$1.jpg"
else
	name="%d-%m-%M-%S.jpg"
fi

image=`scrot -s $name -e 'echo $f'`

key="~/.ssh/id_rsa"
machine="file@machine"
save_path="~/files"

scp -i $key $image $machine:$save_path

rm $image

echo "https://file.gotoindex.com/$image"
