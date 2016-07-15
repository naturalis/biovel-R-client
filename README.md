# biovel-R-client
An example client showing how to connect to biovel services from within R.

Here we show how a RESTful webservice can be invoced from within R, using the package `RCurl`.

This small example uses the [NeXMLExtractor REST endpoint](https://www.biodiversitycatalogue.org/rest_methods/222) published in the 
[Biodiversity catalogue](https://www.biodiversitycatalogue.org) to extract sequence data from a [NeXML](http://www.nexml.org/) file.
The data is returned in FASTA format, and a simple neighbor-joining tree is constructed from the data and subsequently plotted.

## Prerequisites
An installation of `R` and the packages `RCurl` and `phangorn`.

## Running it
From within R, execute the script 'client.R':
`source('client.R')`
