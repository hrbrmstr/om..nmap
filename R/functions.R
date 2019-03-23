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
    fils <- list.files(td, full.names = TRUE)
    print(str(fils))
    fils <- lapply(fils, readLines)
    fils <- stats::setNames(fils, basename(fils))
    return(fils)
  } else {
    return(out)
  }

}
