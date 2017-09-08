#!/bin/bash
set -e
source /rd_build/buildconfig
set -x

/rd_build/ruby_prep.sh

if [[ "$ruby230" = 1 ]]; then /rd_build/ruby2.3.0.sh; fi
if [[ "$ruby231" = 1 ]]; then /rd_build/ruby2.3.1.sh; fi
if [[ "$ruby240" = 1 ]]; then /rd_build/ruby2.4.0.sh; fi
if [[ "$ruby241" = 1 ]]; then /rd_build/ruby2.4.1.sh; fi

cp /rd_build/rbenv-check.sh /usr/local/bin/rbenv-check.sh
/rd_build/ruby_finalize.sh
/rd_build/cleanup.sh
