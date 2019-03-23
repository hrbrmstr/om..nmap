#' @name nmap
#' @title nmap
#' @description Run nmap
#' @param ... Arguments
#' @example /examples/example.R
#' @export
nmap <- function(...) {
  # convert the ... into a argument list
  arglist <- outsider::.arglist_get(...)
  # create an outsider object: describe the arguments and program
  otsdr <- outsider::.outsider_init(repo = 'hrbrmstr/om..nmap',
                                    cmd = 'nmap',
                                    arglist = arglist)
  # run the command
  outsider::.run(otsdr)
}
