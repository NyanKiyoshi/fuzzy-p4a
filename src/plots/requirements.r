requirements <- c(
  'ggplot2'
)

sapply(requirements, function (pkg) {
  install.packages(pkg, repos='http://cran.us.r-project.org')
})
