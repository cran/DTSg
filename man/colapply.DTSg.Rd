% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Swrappers.R
\name{colapply.DTSg}
\alias{colapply.DTSg}
\alias{colapply}
\title{Apply Function Column-wise}
\usage{
\method{colapply}{DTSg}(
  x,
  fun,
  ...,
  cols = self$cols(class = "numeric")[1L],
  resultCols = NULL,
  suffix = NULL,
  helpers = TRUE,
  funby = NULL,
  ignoreDST = FALSE,
  multiplier = 1L,
  funbyHelpers = NULL,
  clone = getOption("DTSgClone")
)
}
\arguments{
\item{x}{A \code{\link{DTSg}} object (S3 method only).}

\item{fun}{A \code{\link{function}}. Its return value must be of length one.}

\item{\dots}{Further arguments passed on to \code{fun}.}

\item{cols}{A character vector specifying the columns to apply \code{fun} to.}

\item{resultCols}{An optional character vector of the same length as
\code{cols}. Non-existing columns specified in this argument are added and
existing columns are overwritten by the return values of \code{fun}. Columns
are matched element-wise between \code{resultCols} and \code{cols}.}

\item{suffix}{An optional character string. The return values of \code{fun}
are added as new columns with names consisting of the columns specified in
\code{cols} and this suffix. Existing columns are never overwritten. Only
used when \code{resultCols} is not specified.}

\item{helpers}{A logical specifying if helper data shall be handed over to
\code{fun}. See details for further information.}

\item{funby}{One of the temporal aggregation level functions described in
\code{\link{TALFs}} or a user defined temporal aggregation level function.
Can be used to apply functions like \code{\link{cumsum}} to a certain
temporal level. See examples and \code{\link{aggregate}} for further
information.}

\item{ignoreDST}{A logical specifying if day saving time is ignored during
formation of the temporal level. See \code{\link{aggregate}} for further
information.}

\item{multiplier}{A positive integerish value \dQuote{multiplying} the
temporal aggregation level of certain \code{\link{TALFs}}. See
\code{\link{aggregate}} for further information.}

\item{funbyHelpers}{An optional \code{\link{list}} with helper data passed on
to \code{funby}. See \code{\link{aggregate}} for further information.}

\item{clone}{A logical specifying if the object is modified in place or if a
clone (copy) is made beforehand.}
}
\value{
Returns a \code{\link{DTSg}} object.
}
\description{
Applies an arbitrary function to selected columns of a \code{\link{DTSg}}
 object.
}
\details{
In addition to the \code{\dots} argument, this method optionally hands over a
 \code{\link{list}} argument with helper data called \code{.helpers} to
 \code{fun}. \code{.helpers} contains the following named elements:
 \itemize{
   \item \emph{.dateTime:} A \code{\link{POSIXct}} vector containing the
     \emph{.dateTime} column.
   \item \emph{periodicity:} Same as \emph{periodicity} field. See
     \code{\link{DTSg}} for further information.
   \item \emph{minLag:} A \code{\link{difftime}} object containing the
     minimum time difference between two subsequent timestamps.
   \item \emph{maxLag:} A \code{\link{difftime}} object containing the
     maximum time difference between two subsequent timestamps.
 }
}
\examples{
# new DTSg object
x <- DTSg$new(values = flow)

# linear interpolation of missing values
## R6 method
x$colapply(fun = interpolateLinear)

## S3 method
colapply(x = x, fun = interpolateLinear)

# daily cumulative sums per month
## R6 method
x$colapply(fun = cumsum, helpers = FALSE, funby = byYm____)

## S3 method
colapply(x = x, fun = cumsum, helpers = FALSE, funby = byYm____)

# calculate moving averages with the help of 'runner' (all four given
# approaches provide the same result with explicitly missing timestamps)
if (requireNamespace("runner", quietly = TRUE) &&
    packageVersion("runner") >= numeric_version("0.3.5")) {
  wrapper <- function(..., .helpers) {
    runner::runner(..., idx = .helpers[[".dateTime"]])
  }

  ## R6 method
  x$colapply(fun = runner::runner, f = mean, k = 5       , lag = -2       )
  x$colapply(fun = wrapper       , f = mean, k = "5 days", lag = "-2 days")
  x$colapply(
    fun = runner::runner,
    f = mean,
    k = "5 days",
    lag = "-2 days",
    idx = x$getCol(col = ".dateTime")
  )
  x$colapply(
    fun = runner::runner,
    f = mean,
    k = "5 days",
    lag = "-2 days",
    idx = x[".dateTime"]
  )

  ## S3 method
  colapply(x = x, fun = runner::runner, f = mean, k = 5       , lag = -2       )
  colapply(x = x, fun = wrapper       , f = mean, k = "5 days", lag = "-2 days")
  colapply(
    x = x,
    fun = runner::runner,
    f = mean,
    k = "5 days",
    lag = "-2 days",
    idx = getCol(x = x, col = ".dateTime")
  )
  colapply(
    x = x,
    fun = runner::runner,
    f = mean,
    k = "5 days",
    lag = "-2 days",
    idx = x[".dateTime"]
  )
}

}
\seealso{
\code{\link{DTSg}}, \code{\link{function}}, \code{\link{cols}},
 \code{\link{TALFs}}, \code{\link{aggregate}}, \code{\link{list}},
 \code{\link{POSIXct}}, \code{\link{difftime}},
 \code{\link{interpolateLinear}}
}
