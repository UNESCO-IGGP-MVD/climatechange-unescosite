source("scp/cckpAPI/createSiteRds.R")

site_file.lst <- list(
  "data/site_file/GEO-BRA-Araripe.R",
  "data/site_file/GEO-URY-Grutas del Palacio.R",
  "data/site_file/GEO-CHL-Kutralkura.R",
  "data/site_file/BR-ARG-Andino Norpatagonica.R",
  "data/site_file/BR-GTM-Maya.R"
)

site_file <- site_file.lst[1]
createSiteRds(site_file)
  
map(site_file.lst, createSiteRds)
