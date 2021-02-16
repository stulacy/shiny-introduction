library(shiny)
library(plotly)

shinyUI(
    
    fluidPage(
        titlePanel("Example 2 - Interactive outputs"),
        # Note that the output functions have changed from example 1
        plotlyOutput("scatter"),
        dataTableOutput("table")
))
