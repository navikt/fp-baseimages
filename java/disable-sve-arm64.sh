#!/usr/bin/env bash

echo "- Disabling SVE for ARM64"
export DEFAULT_JVM_OPTS="${DEFAULT_JVM_OPTS} -XX:UseSVE=0"