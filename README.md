# docker-cron
A simple docker container based on Ubuntu 21.04, that runs a cronjob every minute invoking a shell script. 

## how to install and use it
Copy the repository and build from using the docker-compose.yml:

`docker-compose build docker-cron`

Then start the container (detached):

`docker-compose up -d docker-cron`

## how to see output
The script echos "hello" to stdout/stderr directly. To see the output check the Docker logs. 

`docker logs -f <container>`

## how to modify
To change the interval of the cronjob, just simply edit the *crontab* file.


`* * * * * root /script.sh`


To change the actual job performed just change the content of the *script.sh* file. In default, the script echos "hello" to stdout/stderr directly.


`echo hello > /proc/1/fd/1 2>/proc/1/fd/2`
