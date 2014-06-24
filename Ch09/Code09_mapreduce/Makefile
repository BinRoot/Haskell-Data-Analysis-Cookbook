default:
	wget -N norvig.com/big.txt
	split -d big.txt words
	cabal install --bindir=./

clean:
	rm -rf dist Setup.hs Code0909 *~ words* big.txt
