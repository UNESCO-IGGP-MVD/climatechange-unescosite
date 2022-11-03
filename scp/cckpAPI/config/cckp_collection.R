cckp_collection <- list(
  era5 = tibble(
    collection = "era5",
    variable = c("tas", "tasmin", "tasmax", "txx", "tnn", "pr")
  ),
  
  cmip5 = tibble(
    collection = "cmip5",
    variable = "tas"
  )
)