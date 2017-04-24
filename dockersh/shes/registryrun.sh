docker run -d -p 5001:5000 --restart=always -v /opt/registry-var/auth:/auth/ -e "REGISTRY_AUTH=htpasswd" -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASWD_PATH=/auth/htpasswd -v /usr/dockervolume/registry26_1/:/var/lib/registry/ registry:2.6

