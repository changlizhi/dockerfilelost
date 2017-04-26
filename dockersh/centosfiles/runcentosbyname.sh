name=$1
REGISTRY_IP=192.168.2.103:5000
IMAGE_VERSION=v1
IMAGE_NAME=centos_${name}
IMAGE=${REGISTRY_IP}/${IMAGE_NAME}:${IMAGE_VERSION}

docker build --rm -t ${IMAGE} ./${IMAGE_NAME}/
#docker run -ti --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup ${IMAGE} /usr/sbin/init
