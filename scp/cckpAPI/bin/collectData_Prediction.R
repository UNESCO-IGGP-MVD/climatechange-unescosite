collectData_Prediction <- function(df) {
  cmip5.tmp <- df %>% 
    select(
      scenario, percentile, year, value
    ) %>% 
    pivot_wider(
      names_from = percentile, values_from = value
    )
  
  cmip5.hist.tmp <- cmip5.tmp %>% 
    filter(
      scenario == "historical"
    )
  
  output <- list(
    cmip5 = cmip5.tmp %>% filter(scenario != "historical"),
    cmip5.hist_ref = cmip5.hist.tmp %>% 
      bind_rows(
        cmip5.tmp %>% 
          filter(year == max(cmip5.hist.tmp$year) + 1)
      ) #%>% 
      # select(year, median)
  ) 
  return(output)
}