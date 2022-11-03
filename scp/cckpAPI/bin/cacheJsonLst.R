cacheJsonLst <- function(query, cached.location = "data/cached/", cached.file.type = "rds") {
  cached.location <- "data/cached/"
  cached.file.type <- "rds"
  
  source("scp/cckpAPI/bin/generateFilenameFromQuery.R", local = TRUE)
  filename <- generateFilenameFromQuery(query, suffix = cached.file.type)
  file.location <- str_c(cached.location, filename)
  
  if (file.exists(file.location)) {
    output <- read_rds(file.location)
  } else {
    source("scp/cckpAPI/cckpAPI.R", local = TRUE)
    output <- cckpAPI(query)
    switch (cached.file.type,
      rds = {
        write_rds(output, file.location)
      }
    )
  }
  
  return(output)
}

# lst <- cacheJsonLst(q)
