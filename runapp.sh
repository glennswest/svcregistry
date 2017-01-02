docker kill svcregistry.site.com
docker rm svcregistry.site.com
docker create -p 5000:5000 \
 -v /var/lib/local-registry:/srv/registry \
 -e STANDALONE=true \
 -e MIRROR_SOURCE=https://registry-1.docker.io \
 -e MIRROR_SOURCE_INDEX=https://index.docker.io \
 -e STORAGE_PATH=/srv/registry \
 --name=svcregistry.site.com registry:2
scp svcregistry.service root@s001.site.com:/etc/systemd/system/svcregistry.service
ssh root@s001.site.com service enable svcregistry.service
ssh root@s001.site.com service start svcregistry.service

