# myhomelab
This is my Home lab Stack, Running in lenovo L470 i5 with 24GB RAM.

## How to configure Bind DNS Server.
```
yum install bind bind-utils net-tools -y
copy /etc/named.conf
copy /etc/
copy /var/named/named.forward
copy /var/named/named.reverse
```

## Installing Docker on CentOS
```
yum install -y yum-utils 
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
yum install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm    
yum install docker-ce docker-ce-cli
# systemctl start docker 
# systemctl status docker
# systemctl enable docker
===========================
```
| Applications                     | Image                          |
| ------------------------------- | --------------------------------------------- |
| Gitlab  | export GITLAB_HOME=/srv/gitlab ; export GITLAB_HOME=/srv/gitlab ; docker run --detach --hostname 192.168.9.19 --publish 443:443 --publish 8001:80 --name gitlab --restart always --volume $GITLAB_HOME/config:/etc/gitlab --volume $GITLAB_HOME/logs:/var/log/gitlab --volume $GITLAB_HOME/data:/var/opt/gitlab gitlab/gitlab-ce:latest |
| Jenkins        | docker run -itd --name jenkins -p 8002:8080 nirulabs/jenkins-may22 |
| Ansible        | docker run -itd --name ansible-tower -p 8004:8052 ansible/awx |
| Grafana        | docker run -itd --name grafana -p 3000:3000 grafana/grafana |
| Prometheus     | docker run -itd --name prometheus -p  9090:9090 prom/prometheus |
| Alert Manager  | docker run --name alertmanager -d -p 9093:9093 quay.io/prometheus/alertmanager |
| Container Exporter | docker run -d --name PROM_CON_EXP -p 9104:9104 -v /sys/fs/cgroup:/cgroup -v /var/run/docker.sock:/var/run/docker.sock            prom/container-exporter |
| Node Exporter | docker run -itd --name node-exporter -p 9100:9100 prom/node-exporter:master |
| Jfrog Artifactory| mkdir -p /jfrog/artifactory ; chown -R 1030:1030 /jfrog/artifactory ; chown -R 1030:1030 /jfrog ; docker run --name artifactory -d -p 8081:8081 -p 8082:8082 -p 8084:8084   -v /jfrog/artifactory:/var/opt/jfrog/artifactory   -e EXTRA_JAVA_OPTIONS='-Xmx4g -Xms512m -Xmx2g -Xss256k -XX:+UseG1GC' docker.bintray.io/jfrog/artifactory-oss:latest |
| Nexus Artifactory | docker run -d -p 8081:8081 --name nexus sonatype/nexus3 |
| Postgres | docker run --name postgres -p 8082:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres |
| nginx| docker run -itd  --name nginx -p 8080:80 nginx:1.19-alpine |
| RabbitMQ | docker run -d --hostname poc-01 --name rabbitmq -e RABBITMQ_DEFAULT_USER=gestaltAdmin -e RABBITMQ_DEFAULT_PASS=password rabbitmq:3-management|
| graphite | docker run -d --name graphite --restart=always -p 4040:80 -p 2003-2004:2003-2004 -p 2023-2024:2023-2024 -p 8125:8125/udp -p 8126:8126               graphiteapp/graphite-statsd |

