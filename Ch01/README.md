# Chapter 1
Chapter 1, **The Hunt for Data**, identifies core approaches in reading data from various external sources such as **CSV**, **JSON**, **XML**, **HTML**, **MongoDB**, and **SQLite**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch01.png"/></a></p>

# Recipes
* **Code01**: Accumulating text data from a file path
* **Code02**: Catching I/O code faults
* **Code03**: Keeping and representing data from a CSV file
* **Code04**: Examining a JSON file with the aeson package
* **Code05**: Reading an XML file using the HXT package
* **Code06**: Capturing table rows from an HTML page
* **Code07**: Understanding how to perform HTTP GET requests
* **Code08**: Learning how to perform HTTP POST requests
* **Code09**: Traversing online directories for data
* **Code10**: Using MongoDB queries in Haskell
* **Code11**: Reading from a remote MongoDB server
* **Code12**: Exploring data from a SQLite database

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
