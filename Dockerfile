FROM ubuntu:12.04

MAINTAINER Martin Zajic <zajca@zajca.cz>


#ADD PHP5.4 REPOSITORY
RUN echo "deb http://ppa.launchpad.net/ondrej/php5/ubuntu precise main " > /etc/apt/sources.list.d/ondrej.list &&  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

#UPDATE SYSTEM
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -qqy install \
	php5 \
	php5-dev \
	supervisor \
	git \
	apache2 \
	libapache2-mod-php5 \
	php5-mysql \
	php5-gd \
	php-pear \
	php-apc \
	curl \
	ca-certificates \
	postfix

#install php components
RUN pecl install mongo yaml

#INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && mv /usr/local/bin/composer.phar /usr/local/bin/composer


#EXPOSE 9001
