requirements <- c(
  'ggplot2',
  'gdata',
  'sitools',
  'lintr'
)

sapply(requirements, function (pkg) {
  install.packages(pkg, repos='http://cran.us.r-project.org')
})
