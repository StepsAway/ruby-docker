#!/bin/bash
# skip installing gem documentation
set -ex
mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
buildDeps='bison libgdbm-dev ruby'
packages='build-essential autoconf libxml2-dev libxslt1-dev imagemagick openssl libssl-dev libmagickwand-dev libreadline6 libreadline6-dev libpq-dev libcurl4-openssl-dev zlib1g-dev'
