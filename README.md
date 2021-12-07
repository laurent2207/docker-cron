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

## why the -f (foreground mode) argument?

#### CRON IS A DAEMON
Cron is usually run as a daemon so on startup cron forks, which means it creates a running copy of itself and then terminates the original process.

Which is normally what you want, but when running inside a container docker will stop your container when your main process exits.

#### RUNNING CRON INSIDE A DOCKER IMAGE
The way solve that problem is to instruct cron to start in foreground mode, so that it doesn't fork by using:

`cron -f`

It will execute the jobs you've specified in your crontab file by running cron in foreground mode.

