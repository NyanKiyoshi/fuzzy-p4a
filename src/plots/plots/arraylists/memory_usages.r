library(ggplot2)
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
    xlab("Taille du tableau") + 
    ylab("Utilisation mémoire (octets)") + 
    geom_point() + 
    geom_smooth(method = loess, se = FALSE) + 
    ggtitle("Utilisation mémoire par ArrayList")

  return(plot)
})
