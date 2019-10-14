## DTSg v0.1.3.9000

* Added `swallow` argument to `new` method: allows for a more ressource efficient object creation
* Added `drop` argument to `values` method: allows for a ressource efficient destruction of a `DTSg` object while preserving its *values*
* Added `class` argument to `values` method: can be used to return the *values* of a `DTSg` object as a `data.frame` instead of a `data.table`
* `alter` method and linked with it `new` and other methods now are way more ressource efficient in some cases
* Added `timestamps` field providing the total number of timestamps
* `print` method now ommits empty metadata fields
* Added means to measure code coverage with the help of `covr`
* Removed `xts` from suggested package list (already comes along with `dygraphs`)
* Slightly improved vignettes and documentation
* Minor internal code improvements

## DTSg v0.1.3

* Slightly improved vignettes and documentation

## DTSg v0.1.2

* First release