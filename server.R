# server.R

shinyServer(
  function(input, output)
  {
    output$map <- renderPlot(
      {
        percent_map(
          counties[,switch(input$var,
                           "Percent White" = "white",
                           "Percent Black" = "black",
                           "Percent Hispanic" = "hispanic",
                           "Percent Asian" = "asian")],
          switch(input$var,
                 "Percent White" = "blue",
                 "Percent Black" = "green",
                 "Percent Hispanic" = "purple",
                 "Percent Asian" = "deeppink"),
          input$var,
          input$range[1],
          input$range[2])
      }
    )
  }
)

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
