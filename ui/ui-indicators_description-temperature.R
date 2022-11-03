div(
  span(
    class = "d-flex justify-content-end text-right font-italic text-secondary",
    "Indicators in chart please click to see description: ",
  ),
  div(
    class = "d-flex justify-content-end",
    
# tnn ---------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Daily Minimum Temperature - Monthly Statistics",
      `data-content` = paste0(
      h5("Context"),
        p("The daily minimum temperature index provides information on long-term climate variability and change. Temperature plays a fundamental role in agricultural productivity, biodiversity and public health."),
        h5("Definition"),
        p("The daily minimum air temperature (°C) is representative of the temperature at a height of 2m above the surface. This index provides values for the monthly, seasonal, and annual maxima, minima, and mean of daily minimum air temperature. e.g. the annual maximum of daily minimum temperature is the warmest night of the year.")
      ),
      tags$button(class = "btn btn-sm btn-outline-info", "tnn", id ="vartnn")
    ),

# tasmin ------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Average Daily Minimum Temperature - Monthly Statistics",
      `data-content` = paste0(
      h5("Context"),
        p("Mean temperature describes the average temperature for the 24-hour day. The average temperature is an environmental indicator with many applications in agriculture, engineering, health, energy management, recreation, and more."),
        h5("Definition"),
        p("The average of the daily maximum temperature (Tmax) and the daily minimum temperature (Tmin). Use the Variable menu option to view annual, monthly or seasonal values for this variable.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "tasmin", id ="vartasmin")
    ),

# tas ---------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Average Daily mean Temperature - Monthly Statistics",
      `data-content` = paste0(
      h5("Context"),
        p("The daily mean temperature index provides information on long-term climate variability and change. Temperature plays a fundamental role in agricultural productivity, biodiversity and public health."),
        h5("Definition"),
        p("The daily mean air temperature (°C) is representative of the temperature at a height of 2m above the surface. This index provides values for the monthly mean of daily mean air temperature. The seasonal and annual statistics for this index are averages of these monthly values.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "tas", id ="vartas")
    ),

# tasmax ------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Average Daily Maximum Temperature - Monthly Statistics",
      `data-content` = paste0(
      h5("Context"),
        p("Mean temperature describes the average temperature for the 24-hour day. The average temperature is an environmental indicator with many applications in agriculture, engineering, health, energy management, recreation, and more."),
        h5("Definition"),
        p("The average of the daily maximum temperature (Tmax) and the daily minimum temperature (Tmin). Use the Variable menu option to view annual, monthly or seasonal values for this variable.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "tasmax", id ="vartasmax")
    ),

# txx ---------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Daily Maximum Temperature - Monthly Statistics",
      `data-content` = paste0(
      h5("Context"),
        p("The daily maximum temperature index provides information on long-term climate variability and change. Temperature plays a fundamental role in agricultural productivity, biodiversity and public health."),
        h5("Definition"),
        p("The daily maximum air temperature (°C) is representative of the temperature at a height of 2m above the surface. This index provides values for the monthly, seasonal, and annual maxima, minima, and mean of daily maximum air temperature. e.g. the annual maximum of daily maximum temperature is the hotest day of the year.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "txx", id ="vartxx")
    )
  )
)