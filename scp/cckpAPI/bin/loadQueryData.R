loadQueryData <- function(query) {
  source("scp/cckpAPI/bin/cacheJsonLst.R", local = TRUE)
  lst <- cacheJsonLst(query)
  
  switch (query$collection,
    era5 = {
      source("scp/cckpAPI/bin/era5jsonlstToDf.R", local = TRUE)
      data <- era5jsonlstToDf(lst)
    },
    cmip5 = {
      source("scp/cckpAPI/bin/cmip5jsonlstToDf.R", local = TRUE)
      data <- cmip5jsonlstToDf(lst)
    }
  )
  
  return(data)
  
}
