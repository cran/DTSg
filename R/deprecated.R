byFasttimeWarning <- function() {
  if (isTRUE(getOption("DTSgDeprecatedWarnings"))) {
    warning(
      '"byFasttime*" TALFs are deprecated. Use "funbyApproach" argument instead.',
      call. = FALSE
    )
  }

  if (!requireNamespace("fasttime", quietly = TRUE)) {
    stop('Package "fasttime" must be installed for this TALF.', call. = FALSE)
  }
}

## Truncating family ####
#' @rdname TALFs
#' @export
byFasttimeY_____ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttimeY_____call)
  } else {
    eval(byFasttimeMultY_____call)
  }
}

#' @rdname TALFs
#' @export
byFasttimeYQ____ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  eval(byFasttimeYQ____call)
}

#' @rdname TALFs
#' @export
byFasttimeYm____ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttimeYm____call)
  } else {
    eval(byFasttimeMultYm____call)
  }
}

#' @rdname TALFs
#' @export
byFasttimeYmd___ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  eval(byFasttimeYmd___call)
}

#' @rdname TALFs
#' @export
byFasttimeYmdH__ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttimeYmdH__call)
  } else {
    eval(byFasttimeMultYmdH__call)
  }
}

#' @rdname TALFs
#' @export
byFasttimeYmdHM_ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttimeYmdHM_call)
  } else {
    eval(byFasttimeMultYmdHM_call)
  }
}

#' @rdname TALFs
#' @export
byFasttimeYmdHMS <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttimeYmdHMScall)
  } else {
    eval(byFasttimeMultYmdHMScall)
  }
}

## Extracting family ####
#' @rdname TALFs
#' @export
byFasttime______ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  eval(byFasttime______call)
}

#' @rdname TALFs
#' @export
byFasttime_Q____ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  eval(byFasttime_Q____call)
}

#' @rdname TALFs
#' @export
byFasttime_m____ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttime_m____call)
  } else {
    eval(byFasttimeMult_m____call)
  }
}

#' @rdname TALFs
#' @export
byFasttime___H__ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttime___H__call)
  } else {
    eval(byFasttimeMult___H__call)
  }
}

#' @rdname TALFs
#' @export
byFasttime____M_ <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttime____M_call)
  } else {
    eval(byFasttimeMult____M_call)
  }
}

#' @rdname TALFs
#' @export
byFasttime_____S <- function(.dateTime, .helpers) {
  byFasttimeWarning()
  assertFasttimeOK(.dateTime, .helpers)

  if (.helpers[["multiplier"]] == 1L) {
    eval(byFasttime_____Scall)
  } else {
    eval(byFasttimeMult_____Scall)
  }
}
