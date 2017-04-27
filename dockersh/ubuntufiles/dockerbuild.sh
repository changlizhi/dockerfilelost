name=$1
url=192.168.2.103:5000
image_name=ubuntu_${name}
dir=`dirname $0`
docker build -t ${url}/${image_name}:v1 ${dir}/${image_name}/
