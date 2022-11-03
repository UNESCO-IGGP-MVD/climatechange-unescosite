getSubnationalLstFromSite <- function(site, country_type = c("name", "code"), subnational_type = c("name", "code")) {
  
  country_codes <- map(site$country, "code") %>% flatten_chr()
  
  output <- list()
  
  for (country_code in country_codes) {
    if (subnational_type == "name") {
      subnational <- list(
        map(site$country[[country_code]][["subnational"]], "name") %>% 
          flatten_chr()
      )
    }
    
    if (subnational_type == "code") {
      subnational <- list(
        map(site$country[[country_code]][["subnational"]], "code") %>% 
          flatten_chr()
      )
    }
    
    if (country_type == "name") {
      names(subnational) <- site$country[[country_code]][["name"]]
    }
    
    if (country_type == "code") {
      names(subnational) <- site$country[[country_code]][["code"]]
    }
    
    output <- append(output, subnational)
    
  }
  
  return(output)
}
