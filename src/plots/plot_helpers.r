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

makePlot <- function(basePlot, title, data, color = NULL) {
  if (is.null(color)) {
    gAES <- aes(x = data$size, y = data$mem)
  } else {
    gAES <- aes(x = data$size, y = data$mem, color = color)
  }

  basePlot <- basePlot + geom_point(
    data = data,
    gAES
  )

  basePlot <- basePlot + geom_smooth(
    data = data,
    method = loess,
    se = script.displayConfidenceIntervals,
    gAES
  )

  return(basePlot)
}

makePlotFromData <- function(title, datasets) {
  plot <- ggplot()

  if(length(datasets) == 1) {
    plot <- makePlot(plot, title, datasets[[1]])
  } else {
    i <- 1
    for (data in datasets) {
      plot <- makePlot(plot, title, data, color = names(cOperations)[[i]])
      i <- i + 1
    }
  }

  return(plot + ggtitle(title))
}

makeMemPlot <- function(title, datasets) {
  return(
    makePlotFromData(title, datasets) +
    scale_x_log10('Taille du tableau [cases]', labels=f2si) +
    scale_y_log10('Utilisation mémoire [octets]', labels=f2si)
  )
}

makeETimePlot <- function(title, datasets) {
  return(
    makePlotFromData(title, datasets) +
    scale_x_log10('Taille du tableau [cases]', labels=f2si) +
    scale_y_log10('Temps d\'exécution [secondes]', labels=f2si)
  )
}
