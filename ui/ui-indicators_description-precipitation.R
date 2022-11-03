div(
  span(
    class = "d-flex justify-content-end text-right font-italic text-secondary",
    "Indicators in chart please click to see description: ",
  ),
  div(
    class = "d-flex justify-content-end",

# pr ----------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Aggregated accumulated precipitation - Statistic Monthly",
      `data-content` = paste0(
      h5("Context"),
        p("The aggregated accumulated precipitation provides information on possible water shortage or excess."),
        h5("Definition"),
        p("The aggregated accumulated precipitation (mm) is defined as the monthly sum of the liquid water in particular month over identified period.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "pr", id ="varpr")
    )
  )
)