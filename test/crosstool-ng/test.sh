#!/bin/bash

set -e

source dev-container-features-test-lib

check "ct-ng" bash -c "ct-ng version"
check "meson" bash -c "meson --version"
check "ninja" bash -c "ninja --version"

reportResults
