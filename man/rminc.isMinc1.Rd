\name{rminc.isMinc1}
\Rdversion{1.1}
\alias{rminc.isMinc1}
\title{
    Test File For Minc1 Volume Format
}
\description{
    This logical function returns \code{TRUE} if the input volume is structured
    as a minc1 (netcdf) volume.  Else, \code{FALSE} is returned.
}
\usage{
rminc.isMinc1(filename)
}

\arguments{
  \item{filename}{Minc filename.}
}

\details{
    This function uses the \command{file} system command to determine whether \code{filename}
    refers to a netcdf file. As such, execution of the \command{file} command must return
    the string \dQuote{NetCDF} for minc1 files.
}
\value{ 
    \code{TRUE} is returned for minc1 volumes, \code{FALSE} for everything else.
}

\author{Jim Nikelski \email{nikelski@bic.mni.mcgill.ca}}

\seealso{
    \code{\link{rminc.isMinc2}} \code{\link{rminc.isMinc}} \code{\link{rminc.asMinc2}} \code{\link{rminc.isReadable}}
}

\examples{
\dontshow{
# clear debug flag and get full volume pathname
# ... dunno why zzz.R debug setting is not passed
    R_DEBUG_mincIO <- 0      
    volDir <- system.file("packageData/volumes", package="RMINC")
}
# check for minc1, convert if necessary
myFile <- file.path(volDir, "average305_PET_t1_tal_lin.mnc")
if ( rminc.isMinc1(myFile) ) {
    myFile <- rminc.asMinc2(myFile)
}
}

