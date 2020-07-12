## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(DTSg)

data(flow)
TS <- DTSg$new(flow)
TS

## -----------------------------------------------------------------------------
TS$alter("2007-01-01", "2008-12-31")
# end date is still in the year 2012
TS

options(DTSgClone = FALSE)
getOption("DTSgClone")
TS$alter("2007-01-01", "2008-12-31")
# end date is in the year 2008 now
TS

## -----------------------------------------------------------------------------
TSc <- TS$clone(deep = TRUE)
# or 'clone(TS, deep = TRUE)'

## -----------------------------------------------------------------------------
TS <- DTSg$
  new(flow)$
  alter("2007-01-01", "2008-12-31")$
  colapply(interpolateLinear)$
  aggregate(byYm____, mean)
TS

## -----------------------------------------------------------------------------
if (requireNamespace("magrittr", quietly = TRUE)) {
  library(magrittr)

  TS <- new("DTSg", flow) %>%
    alter("2007-01-01", "2008-12-31") %>%
    colapply(interpolateLinear) %>%
    aggregate(byYm____, mean)
  TS
}

## -----------------------------------------------------------------------------
library(data.table)

DT <- copy(flow)
ls(pattern = "^DT$")
TS <- DTSg$new(DT, swallow = TRUE)
ls(pattern = "^DT$")

## -----------------------------------------------------------------------------
TS <- DTSg$new(flow)
ls(pattern = "^TS$")
DT <- TS$values(drop = TRUE)
ls(pattern = "^TS$")

## -----------------------------------------------------------------------------
# add a column recording if a certain value has been interpolated or not before
# carrying out the interpolation
TS <- DTSg$new(flow)
TS$summary()
TS$
  colapply(
    function(x, ...) {ifelse(is.na(x), TRUE, FALSE)},
    resultCols = "interpolated"
  )$
  colapply(interpolateLinear)$
  summary()

# undo the interpolation (requires additional access to the interpolated column
# which is accomplished with the help of the getCol method or its shortcut [ and
# the freely chosen y argument)
TS$
  colapply(
    function(x, y, ...) {ifelse(y, NA, x)},
    y = TS$getCol("interpolated") # or 'y = TS["interpolated"]'
  )$
  summary()

