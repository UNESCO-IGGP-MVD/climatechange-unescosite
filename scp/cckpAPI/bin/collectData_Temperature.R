collectData_Temperature <- function(df) {
  df_tmp <- df %>% 
    filter(
      variable %in% c("tas", "tasmin", "tasmax", "tnn", "txx")
    ) %>% 
    pivot_wider(names_from = "variable", values_from = "value") %>% 
    arrange(month, year) %>% 
    mutate(id = row_number())
  
  df_tas <- df_tmp %>% 
    select(
      id, month, year, tas, tasmax, tasmin
    )
  
  df_txx <- df_tmp %>% 
    select(
      id, month, year, txx
    ) %>% 
    pivot_longer(txx, names_to = "variable", values_to = "value") %>% 
    group_by(month) %>% 
    slice_max(order_by = value, n = 5) %>% 
    ungroup() 
  
  df_tnn <- df_tmp %>% 
    select(
      id, month, year, tnn 
    ) %>% 
    pivot_longer(tnn, names_to = "variable", values_to = "value") %>% 
    group_by(month) %>% 
    slice_min(order_by = value, n = 5) %>%
    ungroup()
  
 output <- list (
    tas = df_tas,
    txx = df_txx,
    txx.max = df_txx %>% filter(value == max(value)) %>% pull(value),
    txx.max.year = df_txx %>% filter(value == max(value)) %>% pull(year),
    tnn = df_tnn, 
    tnn.min = df_tnn %>% filter(value == min(value)) %>% pull(value),
    tnn.min.year = df_tnn %>% filter(value == min(value)) %>% pull(year)
  )
  
  return(output)
}
