FROM ruby:2.3
MAINTAINER Chris Volk cvolk@commercemtg.com

# Baked-in default env vars: Based on Dev settings.  
# Override on docker run command or docker compose file to set variables for other env's, including prod.
ARG RAILSENV="development"
ARG RACKENV="development"
ENV PORT=5050 \
    RAILS_ENV=$RAILSENV \
    RACK_ENV=$RACKENV \
    SECRET_KEY_BASE="7f774c3500feac93bb93327368f50032e4b179f9686aa99cc9fcca7d1651f8df89fcdd6b2b4cd9fc19c12873894bde7aa154a79843e5e23ca178b266ac4c940f" \
    APPLICATION_BASE_DIR="/srv/www/htdocs"

LABEL environment=$RAILS_ENV
RUN echo "Building container for $RAILS_ENV"

# OS package dependencies
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y \
        build-essential \
        git \
        file \
        nodejs \
        imagemagick \
        libpng12++ \
        libxrender1 \
        libfontconfig1 \
        libpq-dev \
    && apt-get clean

# Other packages - for those that are not available via the normal apt repo
# COPY ./dockerfiles/packages/* ./tmp/

# Debian does not support libjpeg8 in Jessie, get it and install, then clean up
# RUN dpkg -i /tmp/libjpeg8_8d-1+deb7u1_amd64.deb \
#     && rm /tmp/libjpeg8_8d-1+deb7u1_amd64.deb

# PhantomJS (used in automated UI tests)
# RUN cd /opt \
#     && bunzip2 /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
#     && tar xvf /tmp/phantomjs-2.1.1-linux-x86_64.tar \
#     && ln -s /opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/sbin/phantomjs

# Setup base application directory
RUN mkdir -p $APPLICATION_BASE_DIR

# Copy just the Gemfiles and run 'bundle install' separately to
# allow for a layer that only changes if gems are added/modified/deleted,
# yielding smaller docker images and faster build times.  Do not change this.
COPY Gemfile Gemfile.lock /tmp/bundler/
RUN  gem install bundler \
     && cd /tmp/bundler && bundle install --jobs 20 --retry 5  \
     && bundle package --all

# Copy project files to runtime base dir
WORKDIR $APPLICATION_BASE_DIR
COPY . ./
COPY ./dockerfiles/entrypoint.sh ./
RUN chmod 755 entrypoint.sh


# Perform asset precompilation at build time to avoid the 5 - 10 minute hit at application startup time.
# See the entrypoint.sh file for db migrations, etc.
# RUN rake secret
RUN bundle exec rake assets:precompile assets:clean

# Ports accessible outside the container
EXPOSE 5000

ENTRYPOINT ["./entrypoint.sh"]
