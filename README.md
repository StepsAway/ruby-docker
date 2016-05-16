# Docker base images for Ruby

Ruby-docker is a set of is a set of [Docker](https://www.docker.com) images meant to serve as good bases for **Ruby**. It uses [stepsaway/baseimage-docker](https://hub.docker.com/r/stepsaway/baseimage/) as it base image and builds & installs ruby from source.

## Images

Each major version of ruby has its own image and the patch level changes are included in the tag.

## Tags

The tags for Ruby-docker include the patch level for the major ruby version, followed by the version of stepsaway/baseimage-docker which Ruby-docker uses for its base image. For example, Ruby 2.3.0 on stepsaway/baseimage:1.0.0 would be: _stepsaway/baseimage-ruby23:0-1.0.0_
