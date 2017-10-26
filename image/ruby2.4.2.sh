#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

RUBY_MAJOR=2.4
RUBY_VERSION=2.4.2
RUBY_DOWNLOAD_SHA256=93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c
RUBYGEMS_VERSION=2.6.13
BUNDLER_VERSION=1.12.5

ruby_install
