updatePRE_SITE_RECORD <- function(val, input) {
  cantBeNull <- function(val) {
    if (is.null(val)) {
      val <- append(val, 1)
      # print(val)
    }
    
    if (length(val) < 2) {
      val <- prepend(val, 1)
      # print(val)
    }
    
    return(val)
  }
  
  if (input == -1) {
    output <- head(cantBeNull(val), -1)
  } else {
    output <- append(cantBeNull(val), input)
  }
  return(output)
}