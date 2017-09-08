#!/usr/bin/env sh

################################
#
# rbenv-check ensure Ruby package matches rbenv version
#
# Property of StepsAway
#
# Version 0.1
#
################################

RUBY=$(ruby -v | awk '{ print $2 }' | cut -d p -f 1)
RBENV=$(cat $1)

if [ $RUBY != $RBENV ]; then
  echo "Ruby ($RUBY) and rbenv ($RBENV) versions don't match!"
  exit 1
fi
