% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/funinterpolate.R
\name{interpolateLinear}
\alias{interpolateLinear}
\title{Linear Interpolation}
\usage{
interpolateLinear(.col, roll = Inf, rollends = TRUE, .helpers)
}
\arguments{
\item{.col}{A numeric vector.}

\item{roll}{A positive numeric specifying the maximum size of gaps whose
missing values shall be filled. For time series with unrecognised
periodicity it is interpreted as seconds and for time series with recognised
periodicity it is multiplied with the maximum time difference between two
subsequent time steps in seconds. Thus, for regular time series it is the
number of time steps and for irregular it is an approximation of it.}

\item{rollends}{A logical specifying if missing values at the start and end
of the time series shall be filled as well. See
\code{\link[data.table]{data.table}} for further information.}

\item{.helpers}{A \code{\link{list}} with helper data as handed over by
\code{\link{colapply}}. See \code{\link{colapply}} for further information.}
}
\value{
Returns a numeric vector.
}
\description{
Linearly interpolates missing values of a numeric vector. For use with the
 \code{\link{colapply}} method of a \code{\link{DTSg}} object. Other uses are
 possible, but not recommended. It also serves as an example for writing user
 defined \code{\link{function}}s utilising one of the \code{\link{list}}s
 with helper data as handed over by some methods of \code{\link{DTSg}}
 objects. See \code{\link{DTSg}} for further information.
}
\examples{
# new DTSg object
x <- DTSg$new(values = flow)

# linear interpolation of missing values
## R6 method
x$colapply(fun = interpolateLinear)

## S3 method
colapply(x = x, fun = interpolateLinear)

}
\seealso{
\code{\link{DTSg}}, \code{\link{colapply}}, \code{\link{function}},
 \code{\link[data.table]{data.table}}
}
