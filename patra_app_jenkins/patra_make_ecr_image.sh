#!/bin/bash
if [ $# -lt 2 ]; then
echo "not enough arguments"
exit 2
fi
case $1 in
patra-bff)
docker build . -f devops/dockerfiles/Dockerfile-patra-bff  -t "792267852345.dkr.ecr.eu-central-1.amazonaws.com/patra/patra-bff:$2"
docker push 792267852345.dkr.ecr.eu-central-1.amazonaws.com/patra/patra-bff:$2
;;

*)
echo "failed to build as image name not send as a argument"
;;
esac
