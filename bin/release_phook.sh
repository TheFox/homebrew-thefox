#!/usr/bin/env bash

SCRIPT_BASEDIR=$(dirname "$0")
export GITHUB_BASE_URL=https://github.com/drinchev

cd "${SCRIPT_BASEDIR}/.."

./bin/release.sh phook $@
