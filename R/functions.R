#' @name nmap
#' @title nmap
#' @description Run nmap
#' @param ... Arguments
#' @example /examples/example.R
#' @export
nmap <- function(...) {

  td <- tempfile("out-")
  dir.create(td)
  on.exit(unlink(td, recursive=TRUE), add=TRUE)

  # convert the ... into a argument list
  arglist <- outsider::.arglist_get(...)
  # create an outsider object: describe the arguments and program
  otsdr <- outsider::.outsider_init(repo = 'hrbrmstr/om..nmap',
                                    cmd = 'nmap', wd = td,
                                    arglist = arglist)
  # run the command
  out <- outsider::.run(otsdr)

  if (out) {
    fil_names <- list.files(td, full.names = TRUE)
    fils <- lapply(fil_names, function(x) paste0(readLines(x), collapse = "\n"))
    fils <- stats::setNames(fils, basename(fil_names))
    return(fils)
  } else {
    return(out)
  }

}
