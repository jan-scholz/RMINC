% Generated by roxygen2 (4.0.1): do not edit by hand
\name{anatCombineStructures}
\alias{anatCombineStructures}
\title{Combine left and right volumes}
\usage{
anatCombineStructures(vols, method = "jacobians",
  defs=Sys.getenv("RMINC_LABEL_DEFINITIONS"))
}
\arguments{
\item{vols}{Matrix output from call to anatGetAll}

\item{method}{A string specifying the way information was computed at
every voxel ("jacobians","labels","means","sums")}

\item{defs}{A string pointing to the filename containing the label
definitions. Used to map the integers in the atlas to a
proper name for the structure and contains additional
information for laterality of each structure.}
}
\value{
A matrix with ncols equal to the number of collapsed labels
}
\description{
Combines left and right labels from volumes obtained from anatGetAll call
}
\details{
anatCombineStructures collapses left and right volume information into one
measure. If "jacobians","sums",or "labels" is selected then the sum of the left and right is produced, otherwise
the mean is produced.
}
\examples{
getRMINCTestData()
filenames <- read.csv("/tmp/rminctestdata/filenames.csv")
volumes <- anatGetAll(filenames=filenames$absolute_jacobian, atlas="/tmp/rminctestdata/test_segmentation.mnc",
                      method="jacobians",defs="/tmp/rminctestdata/test_defs.csv")
volumes_combined <- anatCombineStructures(vols=volumes, method="jacobians",defs="/tmp/rminctestdata/test_defs.csv")
}
\seealso{
anatLm,anatGetAll
}

