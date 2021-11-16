#!/bin/bash
port=$1
name=$(lsof -i:$port|tail -1|awk '"$1"!=""{print $2}')

if [ -z $name ]
then
 echo "No process can be used to killed!"
 exit 0
fi

id=$(lsof -i:$port|tail -1|awk '"$1"!=""{print $2}')
kill -9 $id
echo "Process name=$name($id) kill!"
exit 0
