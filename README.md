# myhomelab
This is my Home lab Stack, Running in lenovo L470 i5 with 24GB RAM.

## My Technologies.

|  On-Prem      |   Cloud            |    
|---------------|--------------------|
|  Python       |   AWS              |  
|  Jenkins      |   Terraform        | 
|  Ansible      |   AWS DevOps       | 
|  Docker       |   EKS              | 
|  ELK          |   ECS              |
|  Monitoring   |   Git              |
|  Kubernetes   |   Nexus            |
|  Nginx        |   Istio            |


## Docker Containers..
| Applications                     | Image                                         |
| -------------------------------- | --------------------------------------------- |
| Gitlab  | export GITLAB_HOME=/srv/gitlab ; export GITLAB_HOME=/srv/gitlab ; docker run --detach --hostname 192.168.9.19 --publish 443:443 --publish 8001:80 --name gitlab --restart always --volume $GITLAB_HOME/config:/etc/gitlab --volume $GITLAB_HOME/logs:/var/log/gitlab --volume $GITLAB_HOME/data:/var/opt/gitlab gitlab/gitlab-ce:latest |
| Jenkins        | docker volume create jenkins-volume ; docker run -itd --name jenkins -v jenkins-volume:/var/jenkins_home -p 8002:8080 nirulabs/jenkins-may22 |
| Ansible        | docker run -itd --name ansible-tower -p 8004:8052 ansible/awx |
| Grafana        | mkdir /grafana ; docker run -d -p 3000:3000 --name grafana -v grafana:/var/lib/grafana -e "GF_SECURITY_ADMIN_PASSWORD=secret" grafana/grafana |
| Prometheus     | docker run -itd --name prometheus -p  9090:9090 prom/prometheus |
| Alert Manager  | docker run --name alertmanager -d -p 9093:9093 quay.io/prometheus/alertmanager |
| Container Exporter | docker run -d --name PROM_CON_EXP -p 9104:9104 -v /sys/fs/cgroup:/cgroup -v /var/run/docker.sock:/var/run/docker.sock            prom/container-exporter |
| Node Exporter | docker run -itd --name node-exporter -p 9100:9100 prom/node-exporter:master |
| Jfrog Artifactory| mkdir -p /jfrog/artifactory ; chown -R 1030:1030 /jfrog/artifactory ; chown -R 1030:1030 /jfrog ; docker run --name artifactory -d -p 8081:8081 -p 8082:8082 -p 8084:8084   -v /jfrog/artifactory:/var/opt/jfrog/artifactory   -e EXTRA_JAVA_OPTIONS='-Xmx4g -Xms512m -Xmx2g -Xss256k -XX:+UseG1GC' docker.bintray.io/jfrog/artifactory-oss:latest |
| Nexus Artifactory | docker volume create --name nexus-data; docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3 |
| Postgres | docker run --name postgres -p 8082:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres |
| nginx| docker run -itd -v /etc/nginx:/etc/nginx -v /www:/www --name nginx -p 80:80 nginx:1.19-alpine |
| RabbitMQ | docker run -v /rabbitmq-data:/var/lib/rabbitmq -d --hostname dev-server01 --name rabbitmq -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=password -p 8088:15672 -p 8087:5672 rabbitmq:3-management|
| graphite | docker run -d --name graphite --restart=always -p 4040:80 -p 2003-2004:2003-2004 -p 2023-2024:2023-2024 -p 8125:8125/udp -p 8126:8126               graphiteapp/graphite-statsd |
| SonarQube | docker container run -d --name sonarqube-1 -p 9000:9000 sonarqube:lts-developer |
| Swarm Visualizer| docker run -it -d -p 5000:8080 -v /var/run/docker.sock:/var/run/docker.sock dockersamples/visualizer |
| ELK Stack |  Its working in Centos7 - docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk |
| MetricBeat | docker run docker.elastic.co/beats/metricbeat:8.3.3 setup -E setup.kibana.host=kibana:5601 -E output.elasticsearch.hosts=["elasticsearch:9200"]|
