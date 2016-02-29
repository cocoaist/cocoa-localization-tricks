#!/usr/bin/env bash

source ${0%/*}/setup.sh

twine generate-all-string-files \
	$TWINE_FILE \
	$LOCALIZATION_DIRECTORY