#
# If you want to read more about extensions:
# https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Your_first_WebExtension
#

#
# here you define name of your extension
# it wille be used for:
#	-creating extension direcory named after it
# 	-creating main JavaScript file of the extension (by default you will get "name.js")
#	-configuring manifest.json
#
EXTENSION_NAME := app

#
# description of a extension in manifest.json
#
DESCRIPTION = this app does something

#
# URL_MATCH
# -indicates on what sites the plugin will be loaded
#
# it can use wildcards like:
# - " * "
# - " . "
#
URL_MATCH = *://*.mozilla.org/*

message:
	@echo "\nYou must first configure this makefile! Then you can make it run.\n\nBut if you dont want to, just run:\n\n\tmake install\n"

install:
	-mkdir $(EXTENSION_NAME)
	-mkdir $(EXTENSION_NAME)/icons
	-cd ./$(EXTENSION_NAME)
	echo '{\n\n  "manifest_version": 2,\n  "name": "$(EXTENSION_NAME)",\n  "version": "1.0",\n\n  "description": "$(DESCRIPTION)",\n\n  "icons": {\n    "48": "icons/icon-48x48.png"\n  },\n\n  "content_scripts": [\n    {\n      "matches": ["$(URL_MATCH)"],\n      "js": ["$(EXTENSION_NAME).js"]\n    }\n  ]\n\n}' > ./$(EXTENSION_NAME)/manifest.json
	echo 'document.body.style.border = "5px solid red";' > ./$(EXTENSION_NAME)/$(EXTENSION_NAME).js

run:
	firefox about:debugging#/runtime/this-firefox

clean:
	rm -rf ./$(EXTENSION_NAME)