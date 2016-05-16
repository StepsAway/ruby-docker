#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

export RUBY_MAJOR=2.2
export RUBY_VERSION=2.2.5
export RUBY_DOWNLOAD_SHA256=30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3
export RUBYGEMS_VERSION=2.6.4
export BUNDLER_VERSION=1.12.3

ruby_install
