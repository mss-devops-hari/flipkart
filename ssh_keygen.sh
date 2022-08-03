echo "ssh key generation and apply to the git hub..."

read token

cat ~/.ssh/id_rsa.pub

if [ $? -eq 0 ]
then
	echo "ssh keys are created"
	ssh_key=`cat ~/.ssh/id_rsa.pub`
else
	echo "ssh keys are not created, creating ssh key"
	ssh-keygen
	cat ~/.ssh/id_rsa.pub
	if [ $? -eq 0 ]
	then
		echo "ssh keys are created"
        	ssh_key=`cat ~/.ssh/id_rsa.pub`
	else
		echo "failed"
	fi
fi

curl --silent -u "maheswarreddyv:$token" --data "{\"title\":\"ssh_key_test\",\"key\":\"$ssh_key\"}" https://api.github.com/user/keys

if [ $? -eq 0 ]
then
        echo "ssh keys are added to git hub"
else
	echo "ssh keys are adding failed"
fi

