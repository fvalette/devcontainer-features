#!/bin/bash

set -e

source dev-container-features-test-lib
check "check meson version" bash -c "meson --version"
reportResults
