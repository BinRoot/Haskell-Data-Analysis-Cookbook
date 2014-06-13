# Chapter 4
Chapter 4, **Data Hashing**, covers essential hashing functions such as **MD5**, **SHA256**, **GeoHashing**, and **perceptual hashing**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch04.png"/></a></p>

# Recipes
* **Code01**: Hashing a primitive data type
* **Code02**: Hashing a custom data type
* **Code03**: Running popular cryptographic hash functions
* **Code04**: Running a cryptographic checksum on a file
* **Code05**: Performing fast comparisons between data types
* **Code06**: Using a high-performance hash table
* **Code07**: Using Google's CityHash hash functions for strings
* **Code08**: Computing Geohash for location coordinates
* **Code09**: Using a bloom filter to remove unique items
* **Code10**: Running MurmurHash, a simple but speedy hashing algorithm
* **Code11**: Measuring image similarity with perceptual hashes

# How to use
### Setting up the environment
Install the [Haskell Platform](http://www.haskell.org/platform/).

    $ sudo apt-get install haskell-platform

Alternatively, install GHC 7.6 (or above) and Cabal.

    $ sudo apt-get install ghc cabal-install

### Running the code
A `Makefile` is provided in each recipe. Compile the corresponding executable by running `make`.

    $ make

Run the resulting code. For example,

    $ ./Code01

To clean up the directory:

    $ make clean
