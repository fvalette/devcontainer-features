#!/bin/bash

set -e

source dev-container-features-test-lib

check "ct-ng" bash -c "ct-ng version"

reportResults
