FROM php:7.0.12-cli
MAINTAINER Paul McCrodden "paul.mccrodden@x-team.com"

# Run in non interactive mode
ARG DEBIAN_FRONTEND=noninteractive

# Add build and runtime arg
ARG REPO_URL
ENV BASE_URL http://pages.shoov.io

# Run apt-get updates & installs
RUN apt-get clean && apt-get update \
    && apt-get -qq update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install curl git graphicsmagick -y \
    && docker-php-ext-install opcache

  # Install composer globally
  RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install nodejs, npm, npm and Shoov
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install nodejs -y && \
    npm install -g npm && \
    npm install -g mocha yo generator-shoov

# Add shoov user for npm and yo
RUN useradd -ms /bin/bash shoov

# Work from shoov user home dir
WORKDIR /home/shoov/

# Add the current directory to container
ADD . .

# Force ownership to avoid git locking error (for GitHub repo requirement)
RUN chown -R shoov:shoov .

# Change to shoov user
USER shoov

# Webdrivercss / Shoov work around (for GitHub repo requirement)
RUN git init
RUN git config user.email "info@paulmccrodden.com"
RUN git config user.name "Paul McCrodden"
RUN git remote set-url --add origin REPO_URL
RUN git add .

# @todo: add supervisord to add multiple entrypoints
#ENTRYPOINT yo shoov --base-url=${BASE_URL}
ENTRYPOINT /bin/bash
