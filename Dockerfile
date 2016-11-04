FROM node:6.5
MAINTAINER Paul McCrodden "paul.mccrodden@x-team.com"

# Run apt-get updates & installs
RUN apt-get update
RUN apt-get -qq update
RUN apt-get install curl php5-cli git -y
RUN apt-get install nodejs npm -y
RUN apt-get install graphicsmagick -y

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Run npm install for Shoov
RUN npm install -g mocha yo generator-shoov

# Add docker user for npm and yo
RUN useradd -ms /bin/bash docker
USER docker

WORKDIR /home/docker/

ADD ./.shoov.json /home/docker/.shoov.json

EXPOSE 80
