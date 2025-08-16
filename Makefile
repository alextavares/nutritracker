ADB_SERIAL ?=

.PHONY: analyze apk-debug apk-release build-and-install build-and-install-release

analyze:
	flutter analyze

apk-debug:
	flutter pub get && flutter build apk --debug

apk-release:
	flutter pub get && flutter build apk --release

build-and-install:
	@bash scripts/build_install.sh $(if $(ADB_SERIAL),--serial $(ADB_SERIAL),)

build-and-install-release:
	@bash scripts/build_install.sh --release $(if $(ADB_SERIAL),--serial $(ADB_SERIAL),)

