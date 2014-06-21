# Chapter 8
Chapter 8, **Clustering and Classification**, involves quintessential analysis methods involving **k-means clustering**, **hierarchical clustering**, **constructing decision trees**, and **implementing the k-Nearest Neighbors classifier**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch08.png"/></a></p>

# Recipes:
* **Code01**: Implementing the k-means clustering algorithm
* **Code02**: Implementing hierarchical clustering
* **Code03**: Using a hierarchical clustering library
* **Code04**: Finding the number of clusters
* **Code05**: Clustering words by their lexemes
* **Code06**: Classifying the parts of speech of words
* **Code07**: Identifying key words in a corpus of text
* **Code08**: Training a parts of speech tagger
* **Code09**: Implementing a decision tree classifier
* **Code10**: Implementing a k-Nearest Neighbors classifier
* **Code11**: Visualizing points using Graphics.EasyPlot

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
