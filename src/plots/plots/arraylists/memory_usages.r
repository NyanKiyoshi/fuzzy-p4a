library(ggplot2)
library(scales)
library(gdata)
library(sitools)
source('data.r')

# Memory usage of additions
startPlot("ArrayList_Add_MemUsage.jpep", function() {
  data <- getData(
    interfaceIdent = cInterfaces$ArrayList, 
    operationIdent = cOperations$add
  )
  
  plot <- ggplot(
    data, 
    aes(x = data$size, y = data$mem, color = "Add")
  ) + 
    geom_point() + 
    geom_smooth(method = loess, se = FALSE) + 
    ggtitle("Utilisation mémoire par ArrayList") +
    scale_x_log10('Taille du tableau [cases]', labels=f2si) +
    scale_y_log10('Utilisation mémoire [octets]', labels=f2si)

  return(plot)
})
