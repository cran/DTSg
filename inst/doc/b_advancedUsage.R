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
# `TS` was deep cloned before shortening it, hence its end date is still in the
# year 2012
TS

options(DTSgClone = FALSE)
getOption("DTSgClone")
# `TS` was modified in place this time, hence its end date is in the year 2008
# now
TS$alter("2007-01-01", "2008-12-31")
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
# add a new column recording if a certain value is missing or not before
# carrying out a linear interpolation
TS <- DTSg$new(flow)
TS$summary()
TS$
  colapply(
    function(x, ...) {ifelse(is.na(x), TRUE, FALSE)},
    resultCols = "missing"
  )$
  colapply(interpolateLinear)$
  summary()

# undo the linear interpolation (requires additional access to the previously
# created column named "missing", which can be carried out with the help of the
# `getCol` method or its shortcut, the `[` operator, and the freely chosen `y`
# argument)
TS$
  colapply(
    function(x, y, ...) {ifelse(y, NA, x)},
    y = TS$getCol("missing") # or 'y = TS["missing"]'
  )$
  summary()

