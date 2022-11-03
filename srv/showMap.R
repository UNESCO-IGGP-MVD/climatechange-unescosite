output$map <- renderLeaflet({
  # sp_site <- readOGR(SITE()$geojson$boundary)
  sp_site <- SITE()$data$boundary
  
  leaflet(sp_site) %>% 
    # addTiles() %>% 
    addProviderTiles("Stamen.TonerLite") %>% 
    addPolygons()
  
})