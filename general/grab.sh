if [ "$1" != "" ]
then
	name="$1.png"
else
	name=`date +%d-%m-%M-%S.png`
fi

maim -s $name

key="~/.ssh/id_rsa"
machine="file@machine"
save_path="~/files"

scp -i $key $name $machine:$save_path

rm $name

echo "https://file.gotoindex.com/$name"
