library(ggplot2)
library(scales)
library(gdata)
library(sitools)

source('data.r')

startPlot <- function(filename, callback) {
  print(file.path(script.plotdir, filename))
  jpeg(file.path(script.plotdir, filename))
  print(callback())
  dev.off()
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
