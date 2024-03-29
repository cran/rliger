% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mergeObject.R
\name{mergeSparseAll}
\alias{mergeSparseAll}
\alias{mergeDenseAll}
\title{Merge matrices while keeping the union of rows}
\usage{
mergeSparseAll(
  datalist,
  libraryNames = NULL,
  mode = c("union", "intersection")
)

mergeDenseAll(datalist, libraryNames = NULL)
}
\arguments{
\item{datalist}{List of dgCMatrix for \code{mergeSparseAll} or a list of
matrix for \code{mergeDenseAll}.}

\item{libraryNames}{Character vector to be added as the prefix for the
barcodes in each matrix in \code{datalist}. Length should match with the
number of matrices. Default \code{NULL} do not modify the barcodes.}

\item{mode}{Whether to take the \code{"union"} or \code{"intersection"} of
features when merging. Default \code{"union"}.}
}
\value{
dgCMatrix or matrix with all barcodes in \code{datalist} as columns
and the union of genes in \code{datalist} as rows.
}
\description{
\code{mergeSparseAll} takes in a list of DGEs, with genes as
rows and cells as columns, and merges them into a single DGE. Also adds
\code{libraryNames} to colnames from each DGE if expected to be overlap
(common with 10X barcodes). Values in \code{rawData} or \code{normData}
slot of a \linkS4class{ligerDataset} object can be processed with this.

For a list of dense matrices, usually the values in \code{scaleData} slot of
a \linkS4class{ligerDataset} object, please use \code{mergeDenseAll} which
works in the same way.
}
\examples{
rawDataList <- getMatrix(pbmc, "rawData")
merged <- mergeSparseAll(rawDataList, libraryNames = names(pbmc))
}
