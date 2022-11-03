output$description <- renderUI({
  
  site <- SITE()
  
  createCountrySubnationalText<- function(site) {
    source("srv/bin/getSubnationalLstFromSite.R", local = TRUE)
    lst <- getSubnationalLstFromSite(site, "name", "name")
    
    createBadge <- function(txt_lst) {
      map_chr(
        txt_lst,
        ~ span( class = "badge bg-info mx-1", .x ) %>% as.character()
      ) %>% 
        str_flatten() %>% 
        return()
    }
    
    map_chr(
      names(lst), ~ str_c(lst[[.x]], .x, sep = ", ") %>% createBadge
    ) %>%   
      HTML() %>% 
    return()
  }
  
  showSurfaceArea <- function(area) {
    map2_chr(
      names(area), area,
      ~ span(str_c(.x, ": ", .y), class = "badge rounded-pill bg-secondary mx-1") %>% 
        as.character
    ) %>% 
      HTML() %>% 
      return()
  }
  
  div(
    class = "card border-secondary overflow-auto",
    style = 'max-height: 400px;',
    div( class = "card-header", "Site Description and Potential Risks"),
    div(
      class = "card-body",
      h4( class = "card-title mt-0", site$name, ", ", site$type ),
      p(
        class = "card-text",
        span(
          tags$b("Subnationals that contributing data: "),
          createCountrySubnationalText(site)
        ),
        br(),
        # 
        span(
          tags$b("Designated Year: "),
          site$description$year,
        ),
        span(
          class = "mx-5",
          tags$b("Area: ", ),
          # site$description$area
          showSurfaceArea(site$description$area)
        ),
        #
        h5(class = "font-weight-bold", "Description"),
        hr(class = "w-25 ml-0"),
        site$description$txt
      )
    ),
  )
  
})