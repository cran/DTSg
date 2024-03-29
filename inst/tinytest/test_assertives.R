#### assertFunbyApproach ####
expect_error(
  assertFunbyApproach("special"),
  info = "unsupported approach returns error"
)

#### assertFasttimeOK ####
expect_error(
  assertFasttimeOK(seq(
    as.POSIXct("1960-01-01"),
    as.POSIXct("2209-12-31"),
    "1 year"
  ), list(timezone = "UTC")),
  info = 'unsuitable ".dateTime" returns error'
)

expect_error(
  assertFasttimeOK(seq(
    as.POSIXct("1970-01-01"),
    as.POSIXct("2199-12-31"),
    "1 year"
  ), list(timezone = "Europe/Vienna")),
  info = "unsuitable time zone returns error"
)

#### assertFilter ####
expect_error(
  assertFilter(TRUE, Inf),
  info = "logical returns error"
)

#### assertNAstatusPeriodicityOK ####
expect_error(
  assertNAstatusPeriodicityOK("explicit", "unrecognised"),
  info = 'unrecognised "periodicity" returns error'
)

# nolint start
# expect_warning(
#   assertNAstatusPeriodicityOK("explicit", "unrecognised", "warning"),
#   info = 'unrecognised "periodicity" returns warning'
# )
# nolint end

expect_error(
  assertNAstatusPeriodicityOK("implicit", .difftime(0, units = "secs")),
  info = 'implicit "na.status" returns error'
)

# nolint start
# expect_warning(
#   assertNAstatusPeriodicityOK("undecided", .difftime(0, units = "secs"), "warning"),
#   info = 'undecided "na.status" returns warning'
# )
# nolint end

#### assertNoStartingDot ####
expect_error(
  assertNoStartingDot(c("col1", ".col2", "col3")),
  info = "column name with starting dot returns error"
)
