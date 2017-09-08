#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

RUBY_MAJOR=2.4
RUBY_VERSION=2.4.0
RUBY_DOWNLOAD_SHA256=152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
RUBYGEMS_VERSION=2.6.13
BUNDLER_VERSION=1.12.5

ruby_install
