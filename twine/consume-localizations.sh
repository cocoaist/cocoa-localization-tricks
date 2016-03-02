#!/usr/bin/env bash

source ${0%/*}/setup.sh

find $SOURCE_DIR -name \*.m -o -name \*.swift \
	| xargs genstrings -o $LOCALIZATION_DIRECTORY/$DEVELOPMENT_LANGUAGE.lproj/

echo "" > twine/strings

echo "Consuming development language"
twine consume-all-string-files \
	$TWINE_FILE \
	$LOCALIZATION_DIRECTORY/$DEVELOPMENT_LANGUAGE.lproj \
 	--developer-language $DEVELOPMENT_LANGUAGE \
	--consume-all \
	--consume-comments

echo "Consuming additional languages"
for i in ${OTHER_LANGUAGES[@]}; do 
echo "Consuming " $i
twine consume-all-string-files \
	$TWINE_FILE \
	$LOCALIZATION_DIRECTORY/$i.lproj
done
