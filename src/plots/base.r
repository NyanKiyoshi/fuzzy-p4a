script.basepath <- getwd()
script.rootdir <- normalizePath(file.path(script.basepath, '..', '..'))
script.datadir <- file.path(script.rootdir, 'data')
script.plotdir <- file.path(script.rootdir, 'plots')

startPlot <- function(filename, callback) {
  print(file.path(script.plotdir, filename))
  jpeg(file.path(script.plotdir, filename))
  print(callback())
  dev.off()
}
