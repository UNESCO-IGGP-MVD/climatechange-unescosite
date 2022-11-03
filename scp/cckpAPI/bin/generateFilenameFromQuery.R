generateFilenameFromQuery <- function(query, suffix="rds") {
  str_glue(
    "{collection}-{variable}-{country_code}-{subnational_code}.{suffix}",
    collection = query$collection,
    variable = query$variable,
    country_code = query$country_code,
    subnational_code = query$subnational_code
  ) %>% 
    return()
}
