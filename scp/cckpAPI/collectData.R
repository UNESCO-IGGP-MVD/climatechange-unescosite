collectData <- function(query_lst) {
  
  source("scp/cckpAPI/bin/loadQueryData.R", local = TRUE)
  data <- map(
    query_lst, ~map_df(.x, loadQueryData)
  )
  
  merged_data <- list(
    era5 = data$era5 %>% 
      group_by(variable, year, month) %>% 
      summarise(
        value = mean(value),
        .groups = "drop"
      ),
    cmip5 = data$cmip5 %>% 
      group_by(variable, scenario, percentile, year) %>% 
      summarise(
        value = mean(value),
        .groups = "drop"
      )
  )
  
   
  source("scp/cckpAPI/bin/collectData_Temperature.R", local = TRUE)
  source("scp/cckpAPI/bin/collectData_Precipitation.R", local = TRUE)
  source("scp/cckpAPI/bin/collectData_Prediction.R", local = TRUE)
  
  source("scp/cckpAPI/bin/collectData_Boundary.R", local = TRUE)
  
  output <- list(
    temperature = collectData_Temperature(merged_data$era5),
    precipitation = collectData_Precipitation(merged_data$era5),
    prediction = collectData_Prediction(merged_data$cmip5),
    
    boundary = collectData_Boundary(site$geojson$boundary)
  )
  
  return(output)
}
