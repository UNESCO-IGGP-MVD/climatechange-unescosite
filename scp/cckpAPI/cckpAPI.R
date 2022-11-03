
cckpAPI <- function(query) {
  output <- query
  
  switch (query$collection,
# ERA5 --------------------------------------------------------------------
    era5 = {
      subnational_code <- query$subnational_code
      aggregation <- "monthly"
      variable <- query$variable
      url <- str_interp(
        "https://climatedata.worldbank.org/ClimateAPIWeb/rest/v2/era/era5-0.5x0.5-timeseries/${variable}/mean/${aggregation}/timeseries/1970-2020/subnational/${subnational_code}"
      )
    },

# CMIP5 -------------------------------------------------------------------
    cmip5 = {
      subnational_code <- query$subnational_code
      variable <- query$variable
      url <- str_interp(
        "https://climatedata.worldbank.org/ClimateAPIWeb/rest/v2/cmip5/timeseries/${variable}/all/annual/all/timeseries/all/all/smooth_subnational/${subnational_code}"
      )
    }
    
  )
  
  jsonlst <- httr::GET(url) %>% httr::content()
  output[["jsonlst"]] <- jsonlst
  
  Sys.sleep(runif(1, 1, 3))
  
  return(output)
}

