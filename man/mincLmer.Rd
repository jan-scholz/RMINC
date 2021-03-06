% Generated by roxygen2 (4.0.1): do not edit by hand
\name{mincLmer}
\alias{mincLmer}
\title{mincified version of lmer from lme4}
\usage{
mincLmer(formula, data, mask = NULL, parallel = NULL, REML = TRUE,
  control = lmerControl(), start = NULL, verbose = 0L)
}
\arguments{
\item{formula}{the lmer formula, filenames go on left hand side}

\item{data}{the data frame, all items in formula should be in here}

\item{mask}{the mask within which lmer is solved}

\item{parallel}{how many processors to run on (default=single processor).
Specified as a two element vector, with the first element corresponding to
the type of parallelization (sge or snowfall), and the second to the number
of processors to use.}

\item{REML}{whether to use use Restricted Maximum Likelihood or Maximum Likelihood}

\item{control}{lmer control function}

\item{start}{lmer start function}

\item{verbose}{lmer verbosity control}
}
\value{
a matrix where rows correspond to number of voxels in the file and columns to
the number of terms in the formula, with both the beta coefficient and the t-statistic
being returned. In addition, an extra column keeps the log likelihood, and another
whether the mixed effects fitting converged or not.
}
\description{
mincLmer should be used the same way as a straight lmer call, except
that the left hand side of the equation contains minc filenames rather than
an actual response variable.
}
\details{
mincLmer provides an interface to running linear mixed effects models at every
voxel. Unlike standard mincLm, however, testing hypotheses in linear mixed effects models
is more difficult, since the denominator degrees of freedom are more difficult to
determine. RMINC provides two alternatives: (1) estimating degrees of freedom using the
\code{\link{mincLmerEstimateDF}} function, and (2) comparing two separate models using
\code{\link{mincLogLikRatio}} (which in turn can be corrected using
\code{\link{mincLogLikRatioParametricBootstrap}}). For the most likely models - longitudinal
models with a separate intercept or separate intercept and slope per subject - both of these
approximations are likely correct. Be careful in using these approximations if
using more complicated random effects structures.
}
\examples{
\dontrun{
vs <- mincLmer(filenames ~ age + sex + (age|id), data=gf, mask="mask.mnc")
mincWriteVolume(vs, "age-term.mnc", "tvalue-age")
# run in parallel with multiple processors on the local machine
vs <- mincLmer(filenames ~ age + sex + (age|id), data=gf, mask="mask.mnc", parallel=c("snowfall", 4))
# run in parallel with multiple processors over the sge batch queueing system
vs <- mincLmer(filenames ~ age + sex + (age|id), data=gf, mask="mask.mnc", parallel=c("sge", 4))
# estimate degrees of freedom
vs <- mincLmerEstimateDF(vs)
# correct for multiple comparisons using the False Discovery Rate
(qvals <- mincFDR(vs))
# generate another model with a more complex curve for the age term
library(splines)
vs2 <- mincLmer(filenames ~ ns(age,2) + sex + (age|id), data=gf, mask="mask.mnc")
# see if that more complex age term was worth it
modelCompare <- mincLogLikRatio(vs, vs2)
mincFDR(modelCompare)
# see if there was any bias in those p-value estimates (takes a few minutes)
modelCompare <- mincLogLikRatioParametricBootstrap(modelCompare)
mincFDR(modelCompare)
}
}
\seealso{
\code{\link{lmer}} for description of lmer and lmer formulas; \code{\link{mincLm}}
}

