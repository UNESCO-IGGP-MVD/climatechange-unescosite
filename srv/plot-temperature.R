output$weather <- renderPlot({
  lst <- SITE()$data$temperature
  
  # print(lst)
  
  axis_x <- list(
    breaks = lst$tas %>% filter(year == 1970) %>% pull(id),
    labels = lst$tas %>% filter(year == 1970) %>% pull(month),
    xinterpret = lst$tas %>% filter(year == 2020) %>% pull(id),
    limits = c("min" = min(lst$tas$id), "max" = max(lst$tas$id))
  )
  
  legend_colors <- c(
    "txx" = "#E63946",
    "tasmax" = "#E63946",
    "tas" = "#1D3557",
    "tasmin" = "#A8DADC",
    "tnn" = "#457B9D"
  )
  
  ggplot(lst$tas, aes(x = id)) +
    # tas, tasmin and tasmx
    geom_ribbon(
      aes(x = id, y =tas, ymin = tasmin, ymax = tasmax), fill = "#F1FAEE", alpha = 1
    ) +
    geom_line(aes(y = tas, color = "tas"), size = 1) +#, color = "#1D3557") +
    geom_smooth(aes(y = tasmin, group = month, color = "tasmin"), se = FALSE) +#, color = "#E63946") +
    geom_smooth(aes(y = tasmax, group = month, color = "tasmax"), se = FALSE) +#, color = "#A8DADC") +
    scale_x_continuous(breaks = axis_x$breaks, labels = axis_x$labels, expand = c(0, 0)) +
    # scale_y_continuous() +
    # txx and tnn
    geom_point(data = lst$txx, aes(y = value, color = "txx"), size = 3) + #, color = "#E63946") +
    geom_point(data = lst$tnn, aes(y = value, color = "tnn"), size =3) + #, color = "#457B9D") +
    scale_color_manual(values = legend_colors) +
    geom_vline(xintercept = axis_x$xinterpret, linetype = "dashed", color = "lightgray") +
    geom_hline(yintercept = c(lst$tnn.min, lst$txx.max)) +
    # label
    labs(
      title = "Monthly Temperature during 1970-2020 (unit: °C)",
      color = "Temperature Indicators"
    ) +
    annotate("text", x = axis_x$limits["min"] + 1, y = min(lst$tnn$value)-1, hjust=0, vjust = 1, label = str_glue("Monthly minimum value of daily minimum temperature: {temp}°C (appears in {year})", temp = lst$tnn.min, year = lst$tnn.min.year)) +
    annotate("text", x = axis_x$limits["max"] - 1, y = max(lst$txx$value)+1, hjust=1, vjust = 0, label = str_glue("Monthly maximum value of daily maximum temperature: {temp}°C (appears in {year})", temp = lst$txx.max, year = lst$txx.max.year)) +
    # theme
    theme_minimal() +
    theme(
      title = element_text(size = 14, colour = "darkgray"),
      axis.title = element_blank(),
      axis.text.x = element_text(family = "noto", size = 14, hjust = 0, colour = "black"),
      axis.text.y = element_text(family = "noto", size = 14),
      axis.ticks.x = element_blank(),
      legend.position = "top",
      legend.direction = "horizontal",
      legend.title = element_text(family = "noto", size = 10, margin = margin(r = 1, l = 1)),
      legend.text = element_text(family = "noto", size = 10, colour = "darkgray"),
      panel.border = element_rect(fill=NA, color = "gray", linetype = "dashed"),
      panel.grid = element_blank(),
      strip.text = element_text(family = "noto", size = 16, hjust = 0),
      panel.spacing.x = unit(0, "lines")
    )
  
})