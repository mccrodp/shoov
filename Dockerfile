FROM node:6.5
MAINTAINER Paul McCrodden "paul.mccrodden@gmail.com"

ADD . /var/www/auto-exam

WORKDIR /var/www/auto-exam

# Run apt-get updates & installs
RUN apt-get update
RUN apt-get -qq update
RUN apt-get install curl php5-cli git -y
RUN apt-get install nodejs npm -y
RUN apt-get install graphicsmagick -y

# Run npm install for Shoov
RUN npm install -g mocha yo generator-shoov

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
