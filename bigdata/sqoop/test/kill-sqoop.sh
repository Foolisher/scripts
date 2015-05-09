#!/usr/bin/env bash

kill -9 `jps | grep Sqoop | awk '{print $1}'`