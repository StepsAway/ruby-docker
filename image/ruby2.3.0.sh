#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

export RUBY_MAJOR=2.3
export RUBY_VERSION=2.3.0
export RUBY_DOWNLOAD_SHA256=ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
export RUBYGEMS_VERSION=2.6.4
export BUNDLER_VERSION=1.12.4

ruby_install
