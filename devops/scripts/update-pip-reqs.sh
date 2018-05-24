#!/bin/bash
#
# Needs to be run from repo root directory

set -e
set -x

SD_REQ_DIR=securedrop/requirements


make -C admin update-pip-requirements

function pipcompile () {
    pip-compile --no-header --generate-hashes $@
}

pipcompile --output-file ${SD_REQ_DIR}/develop-requirements.txt \
    admin/requirements-ansible.in \
    securedrop/requirements/develop-requirements.in

pipcompile --output-file ${SD_REQ_DIR}/test-requirements.txt \
    ${SD_REQ_DIR}/test-requirements.in

pipcompile --output-file ${SD_REQ_DIR}/securedrop-app-code-requirements.txt \
    ${SD_REQ_DIR}/securedrop-app-code-requirements.in