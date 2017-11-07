mo:
	mkdir -p ./debian/build/locale/cs/LC_MESSAGES
	msgfmt -c po/cs.po -o ./debian/build/locale/cs/LC_MESSAGES/deb-cup.mo

clean:
	rm -rf ./debian/build
