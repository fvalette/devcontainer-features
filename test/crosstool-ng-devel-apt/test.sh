#!/bin/bash

set -e

source dev-container-features-test-lib

check "autoconf" bash -c "autoconf --version"
check "autoheader" bash -c "autoheader --version"
check "awk" bash -c "awk --version"
check "bison" bash -c "bison --version"
check "file" bash -c "file --version"
check "flex" bash -c "flex --version"
check "help2man" bash -c "help2man --version"
check "libtool" bash -c "libtool --version"

reportResults
