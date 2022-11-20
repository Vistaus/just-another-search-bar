MODULES = metadata.json extension.js prefs.js stylesheet.css LICENSE README.md schemas/
INSTALLPATH=~/.local/share/gnome-shell/extensions/just-another-search-bar@xelad0m

all: compile-settings

compile-settings:
	glib-compile-schemas --strict --targetdir=schemas/ schemas

install: all
	rm -rf $(INSTALLPATH)
	mkdir -p $(INSTALLPATH)
	cp -r $(MODULES) $(INSTALLPATH)/
	gnome-extensions enable just-another-search-bar@xelad0m

uninstall:
	gnome-extensions disable just-another-search-bar@xelad0m || (echo "not installed"; exit 1)
	rm -rf $(INSTALLPATH)

bundle: all
	zip -r bundle.zip $(MODULES)

.PHONY: all compile-settings install uninstall bundle 