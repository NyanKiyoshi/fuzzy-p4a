library(ggplot2)
library(scales)
library(gdata)
library(sitools)

source('plot_helpers.r')
source('data.r')

GraphTypes  = c('MemoryUsage', 'ExecTime')
GraphTitles = c('Utilisation mémoire', 'Temps d\'exécution')
GraphFuncs  = c(makeMemPlot, makeETimePlot)

i <- 1
for (graphName in GraphTypes) {
  graphBaseTitle <- GraphTitles[[i]]
  graphFunc <- GraphFuncs[[i]]
  
  for (interfaceType in names(cInterfaces)) {
    for (operationName in names(cOperations)) {
      graphTitle <- makeTitle(graphBaseTitle, interfaceType, operationName)
      graphData <- getData(cInterfaces[interfaceType], cOperations[operationName])
      savePath <- makeSavePath(graphName, interfaceType, operationName)
      
      startPlot(savePath, function() {
        graphFunc(graphData, graphTitle)
      })
    }
  }
  
  i <- i + 1
}
