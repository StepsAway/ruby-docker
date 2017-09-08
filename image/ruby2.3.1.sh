#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

RUBY_MAJOR=2.3
RUBY_VERSION=2.3.1
RUBY_DOWNLOAD_SHA256=b87c738cb2032bf4920fef8e3864dc5cf8eae9d89d8d523ce0236945c5797dcd
RUBYGEMS_VERSION=2.6.13
BUNDLER_VERSION=1.12.5

ruby_install
