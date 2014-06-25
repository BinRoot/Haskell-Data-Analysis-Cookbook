# Chapter 12
Chapter 12, **The Final Exporting**, concludes the book with an enumeration of algorithms for exporting data to **CSV**, **JSON**, **HTML**, **MongoDB**, and **SQLite**.

This is the accompanying source code for [Haskell Data Analysis Cookbook](http://haskelldata.com).
Refer to the book for step-by-step explanations.

<p align="center"><a href="http://haskelldata.com" target="_blank"><img src="http://haskelldata.com/images/ch12.png"/></a></p>

# Recipes
* **Code01**: Exporting data to a CSV file
* **Code02**: Exporting data as JSON
* **Code03**: Using SQLite to store data
* **Code04**: Saving data to a MongoDB database
* **Code05**: Presenting results in an HTML web page
* **Code06**: Creating a LaTeX table to display results
* **Code07**: Personalizing messages using a text template
* **Code08**: Exporting matrix values to a file

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
