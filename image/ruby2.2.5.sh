#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

RUBY_MAJOR=2.2
RUBY_VERSION=2.2.5
RUBY_DOWNLOAD_SHA256=30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3
RUBYGEMS_VERSION=2.6.6
BUNDLER_VERSION=1.12.5

ruby_install
