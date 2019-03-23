#' @name nmap
#' @title Perform an nmap scan
#' @description Run `nmap` with any command-line arguments you want. If you use any
#'              `nmap` outptut directives, make sure to save the output to `/working_dir/FILESPEC`
#'              so the output will be returned. All the output files will be returned from 
#'              top-level of `/working_dir` in a named list. The assumption is made that
#'              the caller is returning scan output so no attempt is made to read raw (binary) 
#'              data. See the Examples for a sample command-line that returns XML reports.
#' @param ... Arguments
#' @example /examples/example.R
#' @export
nmap <- function(...) {

  # make a temp space to hold output
  td <- tempfile("out-")
  dir.create(td)
  on.exit(unlink(td, recursive = TRUE), add = TRUE) # remove it when done

  # convert the ... into a argument list
  arglist <- outsider::.arglist_get(...)
  # create an outsider object: describe the arguments and program
  otsdr <- outsider::.outsider_init(repo = "hrbrmstr/om..nmap",
                                    cmd = "nmap", wd = td,
                                    arglist = arglist)
  # run the command
  out <- outsider::.run(otsdr)

  if (out) {
    fil_names <- list.files(td, full.names = TRUE)
    fils <- lapply(fil_names, function(x) paste0(readLines(x), collapse = "\n"))
    fils <- stats::setNames(fils, basename(fil_names))
    return(fils)
  } else {
    warning(
      "Command execution resulted in non-TRUE return value.", call. = FALSE
    )
    return(invisible(out))
  }

}
