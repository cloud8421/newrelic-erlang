#!/bin/sh

LD_LIBRARY_PATH=./priv:$LD_LIBRARY_PATH \
NEWRELIC_LICENSE_KEY=foo \
NEWRELIC_APP_NAME=Sample NEWRELIC_APP_LANGUAGE=Erlang \
NEWRELIC_APP_LANGUAGE_VERSION=17.4 \
NEWRELIC_LOG_PROPERTIES_FILE=config/log4cplus.properties \
bin/newrelic-collector-client-daemon
