#!/usr/bin/env bash

service postgresql restart
service nginx restart
# keep container running
sleep infinity
