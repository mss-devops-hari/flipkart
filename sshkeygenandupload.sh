#!/bin/bash      
#title           :  
#description     : 
#author		     : Mithun Reddy Lacchannagari
#date            : 08112012
#version         : 1.0    
#usage		     : sh s.sh
#CopyRights      : Mithun Technologies
#Contact         : 9980923226

echo "Enter your GitHub Personal Access Token:"
read token

cat ~/.ssh/id_rsa.pub
#if condition to validate weather ssh keys are already present or not
if [ $? -eq 0 ]
then
	echo "SSH Keys are already present..."
else	
echo "SSH Keys are are not present..., Create the sshkyes by using ssh-keygen command"
ssh-keygen 
echo "SSH Keys successfully generated"
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? -eq 0 ]
then
echo "Copying the key to GitHub account"
curl -X POST -u devopstrainingblr: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 -d "{\"title\": \"SSHKEY\",\"key\": \"$sshkey\"}" "https://api.github.com/user/keys"
if [ $? -eq 0 ]
then 
echo "Successfully copied the token to GitHub"
exit 0
else
echo "Failed"
exit 1
fi
else
echo "Failure in generating the key"
exit 1
fi