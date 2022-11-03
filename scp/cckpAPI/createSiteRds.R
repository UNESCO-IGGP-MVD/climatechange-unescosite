createSiteRds <- function(site_file.path) {
  
  site <- source(site_file.path)$value
  site_name.match <- str_match(site_file.path, "/([^/]+).R$") 
  site_name <- site_name.match[, 2]
  
  source("scp/cckpAPI/createQueryLstFromSite.R", local = TRUE)
  query_lst <- createQueryLstFromSite(site)
  
  source("scp/cckpAPI/collectData.R", local = TRUE)
  data <- collectData(query_lst)
  
  site[["data"]] <- data
  
  output.path <- str_c("dat/site/", site_name, ".rds")
  
  write_rds(site, output.path)
  
  return(output.path)
}