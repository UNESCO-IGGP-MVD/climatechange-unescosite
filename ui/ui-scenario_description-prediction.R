div(
  span(
    class = "d-flex justify-content-end text-right font-italic text-secondary",
    "Model and Scenarios in chart please click to see description: ",
  ),
  div(
    class = "d-flex justify-content-end",

# CMIP5 -------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "The fifth phase of the Coupled Model Intercomparison Project (CMIP5)",
      `data-content` = paste0(
        h5("Context"),
        p("CMIP5 indicators can be investigated either as a multi-model ensemble or by model. It is important to recognize that individual models can have substantial bias and care should be taken in conducting analysis."),
        h5("Definition"),
        p(
          "In 2008 the ",
          a("WCRP Working Group on Coupled Modelling", href="https://www.wcrp-climate.org/wgcm-overview"), " (WGCM), at its ",
          a("12th Session", href="http://eprints.soton.ac.uk/65383/"), " endorsed the ",
          a("CMIP5 protocol", href = "https://doi.org/10.1175/BAMS-D-11-00094.1"), ", which defined a set of thirty-five climate model experiments designed to be useful in: ",
          tags$ol(
            tags$li("assessing the mechanisms responsible for model differences in poorly understood feedbacks associated with the carbon cycle and with clouds"),
            tags$li("examining climate “predictability” and exploring the ability of models to predict climate on decadal time scales, and, more generally"),
            tags$li("determining why similarly forced models produce a range of responses."),
          )  
        ),
        tags$b("source: ", a("World Climate Research Programme", href="https://www.wcrp-climate.org/wgcm-cmip/wgcm-cmip5"))
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-success", "CMIP5", id ="varcmip5")
    ),


# rcp26 -------------------------------------------------------------------

    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Representative Concentration Pathway 2.6",
      `data-content` = paste0(
        h5("Context"),
        p(
          "A Representative Concentration Pathway (RCP) is a greenhouse gas concentration (not emissions) trajectory adopted by the IPCC. Four pathways were used for climate modeling and research for the ",
          a("IPCC fifth Assessment Report", href="https://en.wikipedia.org/wiki/IPCC_Fifth_Assessment_Report"),
          " (AR5) in 2014. The pathways describe different climate futures, all of which are considered possible depending on the volume of greenhouse gases (GHG) emitted in the years to come. The RCPs – originally RCP2.6, RCP4.5, RCP6, and RCP8.5 – are labelled after a possible range of radiative forcing values in the year 2100 (2.6, 4.5, 6, and 8.5 W/m2, respectively)."
        ),
        h5("Definition"),
        p('RCP 2.6 is a "very stringent" pathway. According to the IPCC, RCP 2.6 requires that carbon dioxide (CO2) emissions start declining by 2020 and go to zero by 2100. It also requires that methane emissions (CH4) go to approximately half the CH4 levels of 2020, and that sulphur dioxide (SO2) emissions decline to approximately 10% of those of 1980–1990. Like all the other RCPs, RCP 2.6 requires negative CO2 emissions (such as CO2 absorption by trees). For RCP 2.6, those negative emissions would be on average 2 Gigatons of CO2 per year (GtCO2/yr). RCP 2.6 is likely to keep global temperature rise below 2 °C by 2100.')
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "rcp26", id ="varrcp26")
    ),

# rcp45 -------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Representative Concentration Pathway 4.5",
      `data-content` = paste0(
        h5("Context"),
        p(
          "A Representative Concentration Pathway (RCP) is a greenhouse gas concentration (not emissions) trajectory adopted by the IPCC. Four pathways were used for climate modeling and research for the ",
          a("IPCC fifth Assessment Report", href="https://en.wikipedia.org/wiki/IPCC_Fifth_Assessment_Report"),
          " (AR5) in 2014. The pathways describe different climate futures, all of which are considered possible depending on the volume of greenhouse gases (GHG) emitted in the years to come. The RCPs – originally RCP2.6, RCP4.5, RCP6, and RCP8.5 – are labelled after a possible range of radiative forcing values in the year 2100 (2.6, 4.5, 6, and 8.5 W/m2, respectively)."
        ),
        h5("Definition"),
        p("RCP 4.5 is described by the IPCC as an intermediate scenario. Emissions in RCP 4.5 peak around 2040, then decline. According to resource specialists IPCC emission scenarios are biased towards exaggerated availability of fossil fuels reserves; RCP 4.5 is the most probable baseline scenario (no climate policies) taking into account the exhaustible character of non-renewable fuels."),
        p("According to the IPCC, RCP 4.5 requires that carbon dioxide (CO2) emissions start declining by approximately 2045 to reach roughly half of the levels of 2050 by 2100. It also requires that methane emissions (CH4) stop increasing by 2050 and decline somewhat to about 75% of the CH4 levels of 2040, and that sulphur dioxide (SO2) emissions decline to approximately 20% of those of 1980–1990. Like all the other RCPs, RCP 4.5 requires negative CO2 emissions (such as CO2 absorption by trees). For RCP 4.5, those negative emissions would be 2 Gigatons of CO2 per year (GtCO2/yr). RCP 4.5 is more likely than not to result in global temperature rise between 2 °C and 3 °C, by 2100 with a mean sea level rise 35% higher than that of RCP 2.6. Many plant and animal species will be unable to adapt to the effects of RCP 4.5 and higher RCPs.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "rcp45", id ="varrcp45")
    ),


# rcp60 -------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Representative Concentration Pathway 6.0",
      `data-content` = paste0(
      h5("Context"),
        p(
          "A Representative Concentration Pathway (RCP) is a greenhouse gas concentration (not emissions) trajectory adopted by the IPCC. Four pathways were used for climate modeling and research for the ",
          a("IPCC fifth Assessment Report", href="https://en.wikipedia.org/wiki/IPCC_Fifth_Assessment_Report"),
          " (AR5) in 2014. The pathways describe different climate futures, all of which are considered possible depending on the volume of greenhouse gases (GHG) emitted in the years to come. The RCPs – originally RCP2.6, RCP4.5, RCP6, and RCP8.5 – are labelled after a possible range of radiative forcing values in the year 2100 (2.6, 4.5, 6, and 8.5 W/m2, respectively)."
        ),
        h5("Definition"),
        p("In RCP 6, emissions peak around 2080, then decline. The RCP 6.0 scenario uses a high greenhouse gas emission rate and is a stabilisation scenario where total radiative forcing is stabilised after 2100 by employment of a range of technologies and strategies for reducing greenhouse gas emissions. 6.0 W/m2 refers to the radiative forcing reached by 2100 Projections for temperature according to RCP 6.0 include continuous global warming through 2100 where CO2 levels rise to 670 ppm by 2100 making the global temperature rise by about 3–4 °C by 2100")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "rcp60", id ="varrcp60")
    ),


# rcp85 -------------------------------------------------------------------
    tags$div(
      class = "m-1", `data-toggle`="popover", `data-placement`="bottom", `data-html`="true",
      title = "Representative Concentration Pathway 8.5",
      `data-content` = paste0(
        h5("Context"),
        p(
          "A Representative Concentration Pathway (RCP) is a greenhouse gas concentration (not emissions) trajectory adopted by the IPCC. Four pathways were used for climate modeling and research for the ",
          a("IPCC fifth Assessment Report", href="https://en.wikipedia.org/wiki/IPCC_Fifth_Assessment_Report"),
          " (AR5) in 2014. The pathways describe different climate futures, all of which are considered possible depending on the volume of greenhouse gases (GHG) emitted in the years to come. The RCPs – originally RCP2.6, RCP4.5, RCP6, and RCP8.5 – are labelled after a possible range of radiative forcing values in the year 2100 (2.6, 4.5, 6, and 8.5 W/m2, respectively)."
        ),
        h5("Definition"),
        p("In RCP 8.5 emissions continue to rise throughout the 21st century. Since AR5 this has been thought to be very unlikely, but still possible as feedbacks are not well understood. RCP8.5, generally taken as the basis for worst-case climate change scenarios, was based on what proved to be overestimation of projected coal outputs. It is still used for predicting mid-century (and earlier) emissions based on current and stated policies.")
      ) %>% HTML(),
      tags$button(class = "btn btn-sm btn-outline-info", "rcp85", id ="varrcp85")
    )
  )
)