output$prediction <- renderPlot({
  lst <- SITE()$data$prediction
  
  year_range <- append(lst$cmip5.hist_ref$year, lst$cmip5$year) %>%
    unique()
  
  axis_x <- list(
    xinterpret = lst$cmip5.hist_ref$year %>% max(),
    txt = seq(from = max(year_range), to = min(year_range), by = -10)
  )
  
  ggplot( lst$cmip5, aes(x = year) ) +
    geom_ribbon(
      aes(y = median, ymin = p10, ymax = p90, fill = scenario), alpha = 0.1
    ) +
    geom_line(
      aes(y = median, color = scenario), size = 1
    ) +
    geom_ribbon(
     data = lst$cmip5.hist_ref, aes(y = median, ymin = p10, ymax = p90), fill = "gray", alpha = 0.1
    ) +
    geom_line(
      data = lst$cmip5.hist_ref, aes(x = year, y = median), color = "gray", size = 1
    ) +
    scale_x_continuous(breaks = axis_x$txt, labels = axis_x$txt, expand = c(0, 0)) +
    geom_vline(xintercept = lst$cmip5.dividing, linetype = "dashed", color = "lightgray") +
    labs(
      title =  "Mean Temperature prediction with CMIP5 to 2100 in different emission scenario (unit: °C)"
    ) +
    theme_classic() +
    theme(
      title = element_text(family = "noto", size = 14, colour = "darkgray"),
      axis.title = element_blank(),
      axis.text.x = element_text(family = "noto", size = 14, hjust = 1, color = "black"),
      axis.text.y = element_text(family = "noto", size = 14),
      axis.ticks.x = element_blank(),
      legend.title = element_text(family = "noto", size = 10, margin = margin(r = 1, l = 1)),
      legend.text = element_text(family = "noto", size = 10, colour = "darkgray"),
      legend.position = "top",
      legend.direction = "horizontal",
      panel.grid = element_blank(),
      strip.text = element_text(family = "noto", size = 16, hjust = 0),
      panel.spacing.x = unit(0, "lines")
    )
  
})