#!/bin/bash

set -e

source dev-container-features-test-lib
check "check ninja version" bash -c "ninja --version"
reportResults
