% Generated by roxygen2 (4.0.1): do not edit by hand
\name{mincWriteVolume}
\alias{mincWriteVolume}
\alias{mincWriteVolume.mincSingleDim,mincWriteVolume.mincMultiDim}
\title{Write a MINC volume to file}
\usage{
mincWriteVolume(buffer, ...)
}
\arguments{
\item{buffer}{The data to be written to file. Usually the result of
\link{mincLm} or some such command}

\item{output.filename}{The filename to which to write the data to}

\item{column}{Optional name of the column of a multidimensional MINC
object to write out. By default the first column is used}

\item{like.filename}{An existing MINC filename which has the same
dimensions as the data to be written out. Normally this information
is stored inside MINC data objects}

\item{clobber}{Overwrite existing output file when set to TRUE, will not
overwrite when set to FALSE and will prompt when NULL}
}
\value{
A list with the parameters of the minc volume written
}
\description{
Writes a MINC volume to file
}
\details{
This function takes numeric data, usually the results computed
from one of the other mincFunctions, and writes it to file so that it
can be viewed or manipulated with the standard MINC tools
}
\examples{
getRMINCTestData()
# read the text file describing the dataset
gf <- read.csv("/tmp/rminctestdata/test_data_set.csv")
# run a linear model relating the data in all voxels to Sex
vs <- mincLm(gf$jacobians_fixed_2 ~ Sex, gf)
# write the results to file
mincWriteVolume(vs, "Fstat.mnc", "F-statistic")
}
\seealso{
mincWriteVolume,mincLm,mincFDR,mincMean,mincSd
}

