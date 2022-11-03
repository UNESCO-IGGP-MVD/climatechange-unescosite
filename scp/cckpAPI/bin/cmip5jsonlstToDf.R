cmip5jsonlstToDf <- function(lst) {
  df <- map_df(
    lst$jsonlst,
    ~ flatten_df(.x, .id = "percentile"),
    .id="scenario"
  ) %>% pivot_longer(
    -c(scenario, percentile),
    names_to = "year",
    values_to = "value"
  ) %>% 
    drop_na() %>% 
    mutate(
      collection = lst$collection,
      country = lst$country_code,
      subnational = lst$subnational_code,
      variable = lst$variable,
      year = as.integer(year),
      value = as.numeric(value)
    ) %>% 
    arrange(year)
  
  return(df)
}


  



