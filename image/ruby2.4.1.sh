#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

RUBY_MAJOR=2.4
RUBY_VERSION=2.4.1
RUBY_DOWNLOAD_SHA256=a330e10d5cb5e53b3a0078326c5731888bb55e32c4abfeb27d9e7f8e5d000250
RUBYGEMS_VERSION=2.6.13
BUNDLER_VERSION=1.12.5

ruby_install
