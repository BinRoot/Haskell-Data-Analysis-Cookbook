# Chapter 3
Chapter 3, **The Science of Words**, introduces common string manipulation algorithms including **base conversions**, **substring matching**, and **computing the edit distance**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch03.png"/></a></p>

# Recipes
* **Code01**: Displaying a number in another base
* **Code02**: Reading a number from another base
* **Code03**: Searching for a substring using Data.ByteString
* **Code04**: Searching a string using the Boyer–Moore–Horspool algorithm
* **Code05**: Searching a string using the Rabin-Karp algorithm
* **Code06**: Splitting a string on lines, words, or arbitrary tokens
* **Code07**: Finding the longest common subsequence
* **Code08**: Computing a phonetic code
* **Code09**: Calculating the edit distance between two strings
* **Code10**: Computing the Jaro–Winkler distance between two strings
* **Code11**: Finding strings within one-edit distance
* **Code12**: Fixing spelling mistakes using edit distance

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
