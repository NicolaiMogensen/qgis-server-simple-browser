# Makefile for a PyQGIS plugin

all: compile

dist: package

install: copy2qgis

PY_FILES = ServerSimpleBrowser.py
UI_FILES =
                                                                                                                                                                                                                                                                                                                                                                                                               RESOURCE_FILES =

compile: $(UI_FILES) $(RESOURCE_FILES)

%.py : %.qrc
	pyrcc4 -o $@ $<

%.py : %.ui
	pyuic4 -o $@ $<



clean:
	find ./ -name "*.pyc" -exec rm -rf \{\} \;
	rm -f ../ServerSimpleBrowser.zip
	rm -f Ui_ServerSimpleBrowser.py

package:
	cd .. && find ServerSimpleBrowser/  -print|grep -v Make | grep -v zip | grep -v .git | grep -v .pyc |zip ServerSimpleBrowser.zip -@

localrepo:
	cp ../ServerSimpleBrowser.zip ~/public_html/qgis/ServerSimpleBrowser.zip

copy2qgis: package
	unzip -o ../ServerSimpleBrowser.zip -d ~/.qgis/python/plugins

check test:
	@echo "Sorry: not implemented yet."
