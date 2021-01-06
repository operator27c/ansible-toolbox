#!/usr/bin/env bash

## Hacky wacky script to grab roles from other git sources to put them into this project. 
## Removes the .github folder, but preserves all other files.
## Credit for these roles remain with the original authors. Thank you for making cool stuff!

set -o errexit
set -o pipefail
set -o nounset
## Fail if no arguments are passed, set args to PROJECT_HOME if present...
if [ "$#" -eq 0 ] ; then
	echo "No arg supplied -- Need to specify the PROJECT_HOME variable!"
	exit 1
else
	PROJECT_HOME="$*"
fi

cd $PROJECT_HOME
echo $PROJECT_HOME
sleep 5

##
## geerlingguy docker role
## Reference: https://github.com/geerlingguy/ansible-role-docker
## 
rm -rfv "$PROJECT_HOME/roles/geerlingguy.docker"
wget https://github.com/geerlingguy/ansible-role-docker/archive/master.zip -P /tmp/ansible-role-docker
unzip /tmp/ansible-role-docker/master.zip -d "$PROJECT_HOME/roles/."
rm -rfv /tmp/ansible-role-docker
rm -rfv "$PROJECT_HOME/roles/ansible-role-docker-master/.github"
mv "$PROJECT_HOME/roles/ansible-role-docker-master" "$PROJECT_HOME/roles/geerlingguy.docker"

##
## geerlingguy pip role
## Reference: https://github.com/geerlingguy/ansible-role-pip
##
rm -rfv "$PROJECT_HOME/roles/geerlingguy.pip"
wget https://github.com/geerlingguy/ansible-role-pip/archive/master.zip -P /tmp/ansible-role-pip
unzip /tmp/ansible-role-pip/master.zip -d "$PROJECT_HOME/roles/."
rm -rfv /tmp/ansible-role-pip
rm -rfv "$PROJECT_HOME/roles/ansible-role-pip-master/.github"
mv "$PROJECT_HOME/roles/ansible-role-pip-master" "$PROJECT_HOME/roles/geerlingguy.pip"


