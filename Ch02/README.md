# Chapter 2
Chapter 2, **Integrity and Inspection**, explains the importance of cleaning data through recipes about **trimming whitespace**, **lexing**, and **regular expression matching**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step documentation.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch02.png"/></a></p>

# Recipes
* **Code01**: Trimming excess whitespace
* **Code02**: Ignoring punctuation and specific characters
* **Code03**: Coping with unexpected or missing input
* **Code04**: Validating records by matching regular expressions
* **Code05**: Lexing and parsing an e-mail address
* **Code06**: Deduplication of nonconflicting data items
* **Code07**: Deduplication of conflicting data items
* **Code08**: Implementing a frequency table using Data.List
* **Code08**: Implementing a frequency table using Data.MultiSet
* **Code10**: Computing the Manhattan distance
* **Code11**: Computing the Euclidean distance
* **Code12**: Comparing scaled data using the Pearson correlation coefficient
* **Code13**: Comparing sparse data using cosine similarity

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
