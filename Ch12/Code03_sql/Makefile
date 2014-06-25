default:
	rm -rf test.db
	sqlite3 test.db "CREATE TABLE test (id INTEGER PRIMARY KEY, str text);"
	cabal install --bindir=./

clean:
	rm -rf dist Setup.hs Code1203 *~ test.db
