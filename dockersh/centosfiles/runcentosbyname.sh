name=$1
SHELL_PATH=`dirname $0`
REGISTRY_IP=192.168.2.103:5000
IMAGE_VERSION=v1
IMAGE_NAME=centos_${name}
IMAGE=${REGISTRY_IP}/${IMAGE_NAME}:${IMAGE_VERSION}

docker build --rm -t ${IMAGE} ${SHELL_PATH}/${IMAGE_NAME}/
docker run -ti --cap-add=SYS_ADMIN -v /sys/fs/cgroup:/sys/fs/cgroup ${IMAGE} /usr/sbin/init
