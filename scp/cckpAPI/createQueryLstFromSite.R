createQueryLstFromSite <- function(site, cckp_collection = source("scp/cckpAPI/config/cckp_collection.R")$value) {
  national <- map_df(
    site$country,
    ~ tibble(
      country = .x$name,
      country_code = .x$code,
      subnaiontal = map_chr(.x$subnational, "name"),
      subnational_code = map_chr(.x$subnational, "code")
    )
  )
  
  query_lst <- map(
    cckp_collection, ~ crossing(
      national, .x
    )
  ) %>% 
    map(
      ~ transpose(as.list(.x))
    )
    # as.list() %>% 
    # transpose()
  
  
  return(query_lst)
}
