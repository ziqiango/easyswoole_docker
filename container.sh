#!/usr/bin/env bash

IMAGE_NAME=zhuzq/easyswoole:v3.3.0

exec_path=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
app_path="${exec_path%\/*}"
project_name="${app_path##*\/}"

#echo $app_path
if [ ! $1 ]; then
    command='start'
else
    command=$1
fi

if [ "$command" == "start" ]; then
    if (($(docker ps | grep ${project_name} | wc -l) > 0)); then
        echo "${project_name} is aleady runing!";
    elif (($(docker ps -a | grep ${project_name} | wc -l) > 0)); then
        docker start ${project_name}
    else
        docker run -d -v ${app_path}:/easyswoole -p 9501:9501 --name=${project_name}  ${IMAGE_NAME}
    fi
elif [ "$command" == "bash" -o "$command" == "shell" ]; then
    docker exec -it $project_name bash
elif [ "$command" == "stop" -o "$command" == "restart" ]; then
    docker $command $project_name
else
    echo "not find $command !";
fi