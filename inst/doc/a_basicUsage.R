## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(data.table)
library(DTSg)

data(flow)
flow
summary(flow)

## ------------------------------------------------------------------------
TS <- DTSg$new(
  values = flow,
  ID = "River Flow"
)

## ------------------------------------------------------------------------
TS <- new(
  Class = "DTSg",
  values = flow,
  ID = "River Flow"
)

## ------------------------------------------------------------------------
TS$print() # or 'print(TS)' or just 'TS'

## ------------------------------------------------------------------------
TS$summary() # or 'summary(TS)'
TS$nas(cols = "flow") # or 'nas(TS, cols = "flow")'
if (requireNamespace("dygraphs", quietly = TRUE) &&
    requireNamespace("RColorBrewer", quietly = TRUE)) {
  TS$plot(cols = "flow") # or 'plot(TS, cols = "flow")'
}

## ------------------------------------------------------------------------
flow[date >= as.POSIXct("2007-10-09", tz = "UTC") & date <= as.POSIXct("2007-11-13", tz = "UTC"), ]

## ------------------------------------------------------------------------
TS  <- TS$colapply(fun = interpolateLinear)
# or 'colapply(TS, fun = interpolateLinear)'
TS$nas()

## ------------------------------------------------------------------------
TS$cols() # or 'cols(TS)'
TS$cols(class = "numeric") # or 'cols(TS, class = "numeric")'
TS$cols(class = "character")
TS$cols(class = c("double", "integer")) # class of column flow is numeric
TS$cols(pattern = "f.*w") # or 'cols(TS, pattern = "f.*w")'
TS$cols(pattern = "temp")

## ------------------------------------------------------------------------
TS  <- TS$alter(from = "2007-01-01", to = "2008-12-31")
# or 'alter(TS, from = "2007-01-01", to = "2008-12-31")'
TS

## ------------------------------------------------------------------------
TSm <- TS$aggregate(funby = byYm____, fun = mean)
# or 'aggregate(TS, funby = byYm____, fun = mean)'
TSm

## ------------------------------------------------------------------------
TSQ <- TS$aggregate(funby = by_Q____, fun = mean)
# or 'aggregate(TS, funby = by_Q____, fun = mean)'
TSQ

## ------------------------------------------------------------------------
TSs <- TS$rollapply(fun = mean, na.rm = TRUE, before = 2, after = 2)
# or 'rollapply(TS, fun = mean, na.rm = TRUE, before = 2, after = 2)'
TSs

## ------------------------------------------------------------------------
TS  <- TS$merge(y = TSs, suffixes = c("_orig", "_movavg"))
# or 'merge(TS, y = TSs, suffixes = c("_orig", "_movavg"))'
TS$values()

## ------------------------------------------------------------------------
TS$ID

## ------------------------------------------------------------------------
# two new `DTSg` objects in order to demonstrate reference semantics, which are
# propagated by assignments and broken by deep clones
TSassigned <- TS
TScloned   <- TS$clone(deep = TRUE) # or 'clone(x = TS, deep = TRUE)'

# set new ID
TS$ID <- "Two River Flows"
TS

# due to reference semantics, the new ID is also propagated to `TSassigned`, but
# not to `TScloned` (as all data manipulating methods create a deep clone by
# default, it is usually best to set or update fields after and not before
# calling such a method)
TSassigned
TScloned

