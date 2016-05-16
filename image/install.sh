#!/bin/bash
set -e
source /rd_build/buildconfig
set -x

/rd_build/ruby_prep.sh

if [[ "$ruby225" = 1 ]]; then /rd_build/ruby2.2.5.sh; fi
if [[ "$ruby230" = 1 ]]; then /rd_build/ruby2.3.0.sh; fi
if [[ "$ruby231" = 1 ]]; then /rd_build/ruby2.3.1.sh; fi

/rd_build/ruby_finalize.sh
/rd_build/cleanup.sh