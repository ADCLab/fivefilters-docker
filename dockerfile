FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update
RUN apt-get -y install puppet wget
RUN wget https://bitbucket.org/fivefilters/hosting/raw/master/ubuntu-22.04.pp
RUN puppet apply ubuntu-22.04.pp
RUN apt clean 

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
