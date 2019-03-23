library(ggplot2)
library(scales)
library(gdata)
library(sitools)

source('data.r')

startPlot <- function(filename, callback) {
  savePath <- file.path(script.plotdir, filename)
  print(savePath)
  jpeg(savePath)
  print(callback())
  dev.off()
}

makeSavePath <- function(graphName, typeName, operationName, ext = '.jpg') {
  return (
    paste(
      graphName, typeName, operationName, ext,
      sep = '_'
    )
  )
}

makeTitle <- function(graphTitle, typeName, operationName) {
  return (
    paste(
      graphTitle, 'par', typeName, 'pour la fonction:', operationName, 
      sep = ' '
    )
  )
}

makeMemPlot <- function(data, title) {
  plot <- ggplot(
    data,
    aes(x = data$size, y = data$mem)) +
    geom_point() +
    geom_smooth(method = loess, se = script.displayConfidenceIntervals) +
    ggtitle(title) +
    scale_x_log10('Taille du tableau [cases]', labels=f2si) +
    scale_y_log10('Utilisation mémoire [octets]', labels=f2si)
}

makeETimePlot <- function(data, title) {
  plot <- ggplot(
    data,
    aes(x = data$size, y = data$etime)) +
    geom_point() +
    geom_smooth(method = loess, se = script.displayConfidenceIntervals) +
    ggtitle(title) +
    scale_x_log10('Taille du tableau [cases]', labels=f2si) +
    scale_y_log10('Temps d\'execution [secondes]', labels=f2si)
}
