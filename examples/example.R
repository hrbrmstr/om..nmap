library(outsider)
nmap <- module_import('nmap', repo = 'hrbrmstr/om..nmap')
nmap('-h')  # or --help or whichever argument prints help
nmap("-v", "-oX", "/working_dir/outputfile.xml", "-sS", "localhost")
