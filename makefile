mo:
	mkdir -p ./debian/build/locale/cs/LC_MESSAGES
	msgfmt -c po/cs.po -o ./debian/build/locale/cs/LC_MESSAGES/ppa-uploader.mo
