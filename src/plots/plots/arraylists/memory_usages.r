library(ggplot2)
library(scales)
library(gdata)
library(sitools)

source('plot_helpers.r')
source('plots/arraylists/metadata.r')

# Memory usage of additions
startPlot(getLegend('add', 'memoryUsage', '.jpeg', sep = "_"), function() {
  data <- getData(
    interfaceIdent = cInterfaces$ArrayList, 
    operationIdent = cOperations$add
  )

  plot <- makeMemPlot(
    data, 
    'Utilisation mémoire par ArrayList pour la fonction d\'ajout')

  return(plot)
})

# Memory usage of contains
startPlot(getLegend('contains', 'memoryUsage', '.jpeg', sep = "_"), function() {
  data <- getData(
    interfaceIdent = cInterfaces$ArrayList, 
    operationIdent = cOperations$contains
  )

  plot <- makeMemPlot(
    data, 
    'Utilisation mémoire par ArrayList pour la fonction \'contains\'')

  return(plot)
})

# Memory usage of removals
startPlot(getLegend('remove', 'memoryUsage', '.jpeg', sep = "_"), function() {
  data <- getData(
    interfaceIdent = cInterfaces$ArrayList, 
    operationIdent = cOperations$remove
  )

  plot <- makeMemPlot(
    data, 
    'Utilisation mémoire par ArrayList pour la fonction de suppression')

  return(plot)
})
