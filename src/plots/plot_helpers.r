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

makeSavePath <- function(testName, graphName, typeName, operationName, ext = '.jpg') {
  return (
    paste(
      testName, graphName, typeName, operationName, ext,
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

makePlot <- function(basePlot, title, data, y_attr, color = NULL) {
  if (is.null(color)) {
    gAES <- aes(x = data$size, y = data[[y_attr]])
  } else {
    gAES <- aes(x = data$size, y = data[[y_attr]], color = color)
  }

  basePlot <- basePlot +
    geom_point(
      data = data,
      gAES
    ) +
    geom_smooth(
      data = data,
      method = loess,
      se = script.displayConfidenceIntervals,
      gAES
  )

  return(basePlot)
}

makePlotAxis <- function(plot, data, x_label, y_label) {
  return(plot +
    scale_x_log10(x_label, labels=f2si) +
    scale_y_continuous(y_label)
  )
}

makePlotFromData <- function(
    title, datasets, y_attr, x_label, y_label, colors) {
  
  plot <- ggplot()

  if(length(datasets) == 1) {
    data <- datasets[[1]]

    yAxis <- data[[y_attr]]
    yMin <- min(yAxis)
    yMax <- max(yAxis)

    if (yMax - yMin < 2) {
      yMin <- yMin - 1;
      yMax <- yMax + 1;
    }

    plot <- makePlot(plot, title, data, y_attr)
    plot <- makePlotAxis(plot, data, x_label, y_label)
  } else {
    i <- 1
    data <- datasets[[1]]
    yMin <- NULL
    yMax <- NULL

    for (data in datasets) {

      yAxis <- data[[y_attr]]
      yMin <- min(yMin, min(yAxis))
      yMax <- max(yMax, max(yAxis))

      plot <- makePlot(plot, title, data, y_attr, color = colors[[i]])
      i <- i + 1
    }

    if (yMax - yMin < 2) {
      yMin <- yMin - 1;
      yMax <- yMax + 1;
    }

    plot <- makePlotAxis(plot, data, x_label, y_label)
  }

  return(plot + ggtitle(title) + coord_cartesian(ylim = c(yMin, yMax)))
}

makeMemPlot <- function(title, datasets, colors = names(cOperations)) {
  return(
    makePlotFromData(
      title, datasets, 'mem',
      'Taille du tableau [cases]', 'Utilisation mémoire [octets]',
      colors
    )
  )
}

makeETimePlot <- function(title, datasets, colors = names(cOperations)) {
  return(
    makePlotFromData(
      title, datasets, 'etime',
      'Taille du tableau [cases]', 'Temps d\'exécution [secondes]',
      colors
    )
  )
}
