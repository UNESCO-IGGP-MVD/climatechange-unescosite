output$previous_site_name <- renderText({
  SITEARRAY[tail(PRE_SITE_RECORD, 2)[1]] %>% 
    names()
})

output$current_site_name <- renderText({
  str_c(SITE()$name, ", ", SITE()$type)
})