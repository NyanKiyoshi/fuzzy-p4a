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
  
  perOperationSets <- list()

  for (interfaceType in names(cInterfaces)) {
    opId <- 1
    datasets <- list()

    for (operationName in names(cOperations)) {
      graphTitle <- makeTitle(graphBaseTitle, interfaceType, operationName)
      graphData <- getData(cInterfaces[interfaceType], cOperations[operationName])
      savePath <- makeSavePath(graphName, interfaceType, operationName)

      startPlot(savePath, function() {
        graphFunc(graphTitle, list(graphData))
      })

      datasets[[opId]] = graphData
      opId <- opId + 1
      
      operationSets <- perOperationSets[[operationName]]
      if (is.null(operationSets)) {
        perOperationSets[[operationName]] <- list()
      }
      
      perOperationSets[[operationName]][[length(operationSets) + 1]] <- graphData
    }

    graphTitle <- makeTitle(graphBaseTitle, interfaceType, 'toutes')
    savePath <- makeSavePath(graphName, interfaceType, 'tous')

    startPlot(savePath, function() {
      graphFunc(graphTitle, datasets)
    })
  }
  
  for (operationSetsName in names(perOperationSets)) {
    graphTitle <- makeTitle(graphBaseTitle, 'toutes', operationSetsName)
    savePath <- makeSavePath(graphName, 'toutes', operationSetsName)
    
    startPlot(savePath, function() {
      graphFunc(graphTitle, perOperationSets[[operationSetsName]], names(cInterfaces))
    })
  }

  i <- i + 1
}
