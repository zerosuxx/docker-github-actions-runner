#!/bin/bash

appInstalledErrors=0

assertAppInstalled() {
    if [ $1 == 0 ]; then
        echo -e "\e[92m[OK] "$2" is installed\e[0m"
    else 
        echo -e "\e[91m[ERROR] "$2" is NOT installed\e[0m"
        ((appInstalledErrors=appInstalledErrors+1))
    fi
}

git --version > /dev/null 2>&1
assertAppInstalled $? "git"

curl --version > /dev/null 2>&1
assertAppInstalled $? "curl"

docker --version > /dev/null 2>&1
assertAppInstalled $? "docker"

docker-compose --version > /dev/null 2>&1
assertAppInstalled $? "docker-compose"

jq --version > /dev/null 2>&1
assertAppInstalled $? "jq"

#cd /actions-runner
#result=$(bash ../entrypoint.sh)
#echo $result

errorsCount=($appInstalledErrors)

exit $errorsCount