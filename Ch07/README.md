# Chapter 7
Chapter 7, **Statistics and Analysis**, begins the investigation of important data analysis techniques encompassing **regression algorithms**, **Bayesian networks**, and **neural networks**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch07.png"/></a></p>

# Recipes:
* **Code01**: Calculating a moving average
* **Code02**: Calculating a moving median
* **Code03**: Approximating a linear regression
* **Code04**: Approximating a quadratic regression
* **Code05**: Obtaining the covariance matrix from samples
* **Code06**: Finding all unique pairings in a list
* **Code07**: Using the Pearson correlation coefficient
* **Code08**: Evaluating a Bayesian network
* **Code09**: Creating a data structure for playing cards
* **Code10**: Using a Markov chain to generate text
* **Code11**: Creating n-grams from a list
* **Code12**: Constructing a neural network perception

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
