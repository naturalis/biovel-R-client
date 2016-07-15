## This R script demonstrates how to run a simple web service published in the
## biovel biodiversity catalogue using R.
##
## The webservice (NeXMLExtractor https://www.biodiversitycatalogue.org/rest_methods/222)
## takes as input a nexml document from which then information can be extracted. Below,
## we extract the 'Matrices' (DNA alignment) and use this as input to build
## a phylogenetic tree using the 'phangorn' package

require('phangorn')
require('RCurl')


## Define parameters for web service:
## URL and name of webservice
url <- 'http://biovel.naturalis.nl/biovel'
service <- 'NeXMLExtractor'
## encoded location of input NexML file
nexml <- URLencode('http://raw.githubusercontent.com/naturalis/biovel-nbc/master/Examples/treebase-record.xml')
## Item(s) to exatract
object <- 'Matrices'
## format of the extracted object
dataformat <- 'fasta'

## make query for web service
rest.query <- paste0(url,
                     '?',
                     'service=',service,
                     '&',
                     'nexml=', nexml,
                     '&',
                     'object=', object,
                     '&',
                     'dataformat=', dataformat)

## query web service and get result as FASTA string
fasta.str <- getURL(rest.query)

## write result into temporary directory
temp <- tempfile()
write(fasta.str, file=temp)

## read data as alignment
data <- read.phyDat(temp, format=dataformat)

## make a simple Neighbor-joining tree and root as outgroup, plot tree
dm <- dist.ml(aln)
tree <- NJ(dm)
tree <- root(tree, "Grifola sordulenta", resolve.root=T)
plot(tree)
