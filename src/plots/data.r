source('base.r', chdir = TRUE)

# benchData contains the read benchmark data (tab separated file)
# Notes, headers are: testid size op type etime mem
benchData <- read.table(
  file.path(script.datadir, 'benchmark.data'),
  sep = '\t', header = TRUE)

# cInterfaces contains the different interfaces contained in benchData
# Usage: cInterfaces$ArrayList
cInterfaces <- list(
  ArrayList = 0,
  LinkedList = 1,
  HashSet = 2
)

# cOperations contains the different operation types contained in benchData
# Usage: cOperations$add
cOperations <- list(
  add = 0,
  contains = 1,
  remove = 2
)

# getData filters given test data from the whole benchmark data
# Usage: 
#   getData(cInterfaces$ArrayList, cOperations$add)
getData <- function(interfaceIdent, operationIdent) {
  filteredData <- benchData[ which(benchData$type == interfaceIdent 
                                   & benchData$op == operationIdent), ]
  names(filteredData) <- names(benchData)
  return(filteredData)
}
