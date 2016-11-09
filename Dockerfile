FROM php:7.0.12-cli
MAINTAINER Paul McCrodden "paul.mccrodden@x-team.com"

# Run apt-get updates & installs
RUN apt-get update \
    && apt-get -qq update \
    && apt-get install curl git graphicsmagick -y \
    && docker-php-ext-install opcache pdo json

# Install nodejs & npm
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install nodejs -y && \
    npm install -g npm

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Run npm install for Shoov
RUN npm install -g mocha yo generator-shoov

# Add docker user for npm and yo
RUN useradd -ms /bin/bash docker
USER docker

WORKDIR /home/docker/

ADD . /home/docker/
