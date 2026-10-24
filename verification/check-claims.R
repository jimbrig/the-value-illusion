# probes that the book treats as mechanics. base R only.
# a failure here means a chapter is describing a different language than this R.

claims <- list()

record <- function(name, ok, detail) {
  claims[[length(claims) + 1L]] <<- list(name = name, ok = ok, detail = detail)
  if (isTRUE(ok)) {
    message(sprintf("ok   %s", name))
  } else {
    message(sprintf("FAIL %s -- %s", name, detail))
  }
}

record(
  "NULL, c(), and pairlist() are identical",
  identical(NULL, c()) && identical(NULL, pairlist()),
  sprintf("identical(NULL, c())=%s identical(NULL, pairlist())=%s", identical(NULL, c()), identical(NULL, pairlist()))
)

record(
  "empty list() is not NULL",
  !identical(NULL, list()) && typeof(list()) == "list" && length(list()) == 0L,
  sprintf("typeof=%s length=%s identical=%s", typeof(list()), length(list()), identical(NULL, list()))
)

record(
  "typed empties keep their type",
  typeof(integer()) == "integer" &&
    typeof(double()) == "double" &&
    typeof(character()) == "character" &&
    typeof(logical()) == "logical" &&
    typeof(complex()) == "complex" &&
    typeof(raw()) == "raw" &&
    !identical(integer(), NULL),
  "one of the typed empties collapsed or changed typeof"
)

record(
  "factor is an integer object, not a separate typeof",
  typeof(factor(1L)) == "integer" && is.object(factor(1L)) && !is.object(integer()),
  sprintf("typeof=%s is.object(factor)=%s is.object(integer())=%s", typeof(factor(1L)), is.object(factor(1L)), is.object(integer()))
)

record(
  "sum is a builtin and [ is a special",
  typeof(sum) == "builtin" && typeof(`[`) == "special" && typeof(`{`) == "special" && typeof(function() NULL) == "closure",
  sprintf("sum=%s [=%s {=%s function=%s", typeof(sum), typeof(`[`), typeof(`{`), typeof(function() NULL))
)

record(
  "an environment is an environment",
  typeof(new.env(parent = emptyenv())) == "environment",
  typeof(new.env(parent = emptyenv()))
)

failed <- Filter(function(x) !isTRUE(x$ok), claims)
if (length(failed) > 0L) {
  stop(sprintf("%d runtime claim(s) failed", length(failed)), call. = FALSE)
}

message(sprintf("all %d claims held on R %s", length(claims), getRversion()))
