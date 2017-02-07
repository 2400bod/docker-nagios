# docker-nagios 

This image ( [2400bod/nagios](https://hub.docker.com/r/2400bod/nagios/) ) was created from [alpine:latest](https://hub.docker.com/r/library/alpine/) and included [nagios-image](https://anonscm.debian.org/git/pkg-nagios/pkg-nagios-images.git) pack and [check_nrpe](https://github.com/NagiosEnterprises/nrpe.git) plugin.

### Commands

#### Run
```
docker run -d --name=nagios		\
	-v /opt/nagios/etc:/etc/nagios	\
	-v /opt/nagios/var:/var/nagios	\
	-p 0.0.0.0:80:80 2400bod/nagios
```

#### Check config
`docker exec -ti nagios check-config`

#### Logs
`docker logs [-f] nagios`

#### Reload config
`docker exec -ti nagios reload` or `docker restart nagios`

#### Add user
`docker exec -ti nagios htpasswd /etc/nagios/nagios.users USERNAME`

---
Username `nagiosadmin`, password `nagios`, timezone "UTC". 
To change these parameters need to rebuild the image.      
