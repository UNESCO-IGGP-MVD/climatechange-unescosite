era5jsonlstToDf <- function(lst) {
  month_fct_level <- c(
    "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"
  )
  
  df <- map_df(lst$jsonlst, as_tibble, .id = "year") %>% 
    pivot_longer(-year, names_to = "month", values_to = "value") %>% 
    mutate(
      country = lst$country_code,
      subnational = lst$subnational_code,
      variable = lst$variable,
      month = as_factor(month) %>% fct_relevel(month_fct_level),
      value = as.numeric(value)
    ) %>% 
    arrange(
      year, month
    )
  
  return(df)
}
