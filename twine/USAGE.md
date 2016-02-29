You need to install twine to use these commands. To install twine

	sudo gem install twine

First you need to consume localization files into `twine/strings` file.

	twine/consume-localizations.sh

Now you have all strings in `twine/strings` file. You can open this file and
translate missing translations and update it. After you have done with the translations you need to put translated strings back.

	twine/generate-localizations.sh
