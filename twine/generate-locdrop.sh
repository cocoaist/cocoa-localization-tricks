#!/usr/bin/env bash

source ${0%/*}/setup.sh

function join { local IFS="$1"; shift; echo "$*"; }

twine generate-loc-drop \
	--format=apple \
	--include=untranslated \
	$TWINE_FILE \
	$DIR/LocDrop.zip