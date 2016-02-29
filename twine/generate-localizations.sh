#!/usr/bin/env bash

source ${0%/*}/setup.sh

twine generate-all-string-files \
	$TWINE_FILE --include translated $LOCALIZATION_DIRECTORY