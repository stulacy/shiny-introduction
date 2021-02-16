library(shiny)
library(plotly)

shinyUI(
    fluidPage(
        titlePanel("Example 3 - User input"),
        plotlyOutput("scatter"),
        radioButtons("xvar", "Select x variable", 
                     choices=c("Sepal.Length",
                               "Sepal.Width",
                               "Petal.Width")),
        textOutput("text")
))
