
# LIBRARY -----------------------------------------------------------------
library(tidyverse)
library(shiny)
library(htmltools)
library(bslib)
library(leaflet)
library(sf)
library(showtext)
library(thematic)


# CONFIG ------------------------------------------------------------------

SITELIST <- source("dat/siteList.R")$value
SITEARRAY <- flatten(SITELIST)
PRE_SITE_RECORD <- NULL
apptheme <- bs_theme(
  version = 4, 
  bootswatch = "lumen",
  base_font = font_google("Noto Sans Mono")
) %>% 
  bs_add_rules(sass::sass_file("www/style.scss"))

font_add_google("Noto Sans Mono", family = "noto")
thematic_theme(font = "auto")
thematic_shiny(font = "auto")

# UI ----------------------------------------------------------------------

ui <- fluidPage(
  lang = "EN",
  theme = apptheme,
  
  tags$head(
    tagList(
      tags$link(rel="stylesheet", href="style.scss"),
      tags$script(src = "js/bootstrap.bundle.min.js"),
      tags$script(src = "js/script.js")
    )
  ),
  
  fluidRow(column(
    width = 12,
    titlePanel(
      "Explore weather change in the UNESCO designated sites Biosphere Reserves and UNESCO Global Geoparks in LAC"
    )
  )),
  fluidRow(
    column(
      width = 4,
      class = "col-sm-4 d-flex flex-column",
      p(
        class = "text-center m-0",
        "Previous Site:",
        textOutput("previous_site_name", inline = TRUE)
      ),
      actionButton('prevSite', label = "Previous Site")
    ),
    column(
      width = 4,
      class = "col-sm-4 d-flex flex-column",
      p(class = "text-center m-0", "Select a Site"),
      selectizeInput(
        'site',
        label = NULL,
        choices = SITELIST,
        width = "100%",
        selected = SITELIST[[1]][[1]]
      )
    ),
    column(
      width = 4,
      class = "col-md-4 d-flex flex-column",
      p(class = "text-center m-0", "See a Random Site"),
      actionButton('randomSite', "I Feel Lucky", icon('dice'))
    )
  ),
  
  fluidRow(
    tags$style('max-height: 400px;'),
    column(width = 4,
           div(class = "mh-100",
               leafletOutput("map"))),
    column(width = 8,
           uiOutput("description"))
  ),
  
  hr(),
  
  
  # PLOT --------------------------------------------------------------------
  column(
    width = 12,
    h4(
      class = "fw-bold",
      "Weather normals of history and prediction in: ",
      textOutput("current_site_name", inline = TRUE)
    ),
    
    plotOutput("weather", height = "600px"),
    source("ui/ui-indicators_description-temperature.R")$value,
      
    plotOutput("precipitation"),
    source("ui/ui-indicators_description-precipitation.R")$value,
    
    plotOutput("prediction"),
    source("ui/ui-scenario_description-prediction.R")$value,
    
    hr(),
  ),
  
  # FOOTER ------------------------------------------------------------------
  
  div(
    class = "small_text",
    p(
      class = "",
      "The iconic UNESCO-designated World Heritage sites, Biosphere Reserves and UNESCO Global Geoparks provide useful platforms to apply and test climate monitoring, mitigation and adaptation, and to raise awareness on climate change impacts on human societies, cultural diversity, biodiversity, ecosystem services, and the world’s natural and cultural heritage. Spread across different regions, climates and ecosystems around the world, climate change is already being felt in many UNESCO-designated sites. Communities there are working on innovative ways to address climate change."
    ),
    
    p(
      "This tools is developed by",
      a(
        "Platform for climate change, risk and resilience in UNESCO sites in Latin America and the Caribbean",
        href = "https://espaciointeligencia.wixsite.com/my-site"
      ),
      "of ", a("the UNESCO Montevideo", href = "https://es.unesco.org/fieldoffice/montevideo"),
      "Regional Bureau for Sciences in Latin America and the Caribbean Cluster Office for Argentina, Paraguay and Uruguay."
    ),
    
    icon("database"),
    "Data sourced from",
    a(
      href = "https://climateknowledgeportal.worldbank.org/",
      "Climate CHange Knowledge Portal For Development Practitioners and Policy Makers"
    ),
    "The Climate Change Knowledge Portal (CCKP) provides global data on historical and future climate, vulnerabilities, and impacts.",
    "For sites across multiple subnational the average across all subnational data is used."
  ),
  # div(
  #   id = "source_link",
  #   class = "source_link",
  #   a(href = "", "View source code on github", icon("github"))
  # )
)




# SERVER ------------------------------------------------------------------

server <- function(input, output, session) {
  SITE <- reactiveVal(read_rds(SITEARRAY[[1]]))
  BACKWARD_VALVE <- FALSE
  
  source("srv/bin/updatePRE_SITE_RECORD.R", local = TRUE)
  
  observeEvent(input$prevSite, {
    BACKWARD_VALVE <<- TRUE
    last_one <- tail(PRE_SITE_RECORD, 2)[1]
    updateSelectizeInput(inputId = "site", selected = SITEARRAY[last_one])

    PRE_SITE_RECORD <<- updatePRE_SITE_RECORD(PRE_SITE_RECORD, -1)
  })
  
  observe({
    req(input$site)
    
    if (BACKWARD_VALVE == FALSE) {
      PRE_SITE_RECORD <<- updatePRE_SITE_RECORD(PRE_SITE_RECORD, which(SITEARRAY == input$site))
    } else {
      BACKWARD_VALVE <<- FALSE
    }
    
    SITE(read_rds(input$site))
    
    source("srv/updatePreviousSiteName.R", local = TRUE)
    
    source("srv/showMap.R", local = TRUE)
    source("srv/showDescription.R", local = TRUE)
    
    source("srv/plot-temperature.R", local = TRUE)
    source("srv/plot-precipitation.R", local = TRUE)
    source("srv/plot-prediction.R", local = TRUE)
  })
  
  observeEvent(input$randomSite, {
    updateSelectizeInput(inputId = "site", selected = sample(SITEARRAY, 1))
  })
}

shinyApp(ui, server)