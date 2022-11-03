collectData_Precipitation <- function(df) {
  output <- df %>% 
    filter(
      variable %in% c("pr")
    ) %>% 
    mutate(
      year_group = cut_width(year, 10, boundary = 0, close = "right", dig.lab = 4)
    ) %>% 
    group_by(month) %>% 
    summarise(
      year_group,
      value = value,
      .groups = "drop"
    )
  
  return(output)
}