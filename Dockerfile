FROM php:7.0.12-cli
MAINTAINER Paul McCrodden "paul.mccrodden@x-team.com"

# Run apt-get updates & installs
RUN apt-get clean && apt-get update \
    && apt-get -qq update \
    && apt-get install curl git graphicsmagick -y \
    && docker-php-ext-install opcache pdo json

  # Install composer globally
  RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install nodejs, npm, npm and Shoov
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install nodejs -y && \
    npm install -g npm && \
    npm install -g mocha yo generator-shoov

# Add shoov user for npm and yo
RUN useradd -ms /bin/bash shoov
USER shoov

WORKDIR /home/shoov/

ADD . /home/shoov/

# Webdrivercss / Shoov work around (GitHub repo requirement).
RUN git init
RUN git remote add origin $REPO_URL

CMD yo shoov --base-url=$BASE_URL
