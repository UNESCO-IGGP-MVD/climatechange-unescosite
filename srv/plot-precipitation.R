output$precipitation <- renderPlot({
  df <- SITE()$data$precipitation
  
  ggplot(df, aes(x = year_group, y = value, group = year_group)) +
    geom_boxplot(aes(fill = year_group)) +
    # scale_fill_manual(values = c("#EEF1FF", "#D2DAFF", "#A8DADC", "#AAC4FF", "#B1B2FF")) +
    scale_fill_brewer(palette = "PuBu") +
    facet_wrap(~month, nrow = 1, strip.position = c("bottom")) +
    labs(
      title = "Monthly Precipitation during 1970-2020 divided in years groups of 10 (unit: mm)",
      fill = "Year Group"
    ) +
    theme_minimal() +
    theme(
      title = element_text(size = 14, colour = "darkgray"),
      axis.title = element_blank(),
      panel.spacing = unit(0, "mm"),
      legend.title = element_text(family = "noto", size = 10, margin = margin(r = 1, l = 1)),
      legend.text = element_text(family = "noto", size = 10, colour = "darkgray"),
      legend.position = "top",
      legend.direction = "horizontal",
      axis.text.x = element_blank(),
      axis.text.y = element_text(family = "noto", size = 14),
      axis.ticks.x = element_blank(),
      panel.border = element_rect(
        fill = NA,
        color = "gray",
        linetype = "dashed"
      ),
      panel.grid = element_blank(),
      strip.text = element_text(family = "noto", size = 14, hjust = 0),
      panel.spacing.x = unit(0, "lines")
    )
})