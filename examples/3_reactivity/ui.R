library(shiny)
library(plotly)

shinyUI(
    fluidPage(
        titlePanel("Example 3 - Reactivity"),
        # Input widget
        radioButtons("xvar", "Select x variable", 
                     choices=c("Sepal.Length",
                               "Sepal.Width",
                               "Petal.Width"),
                     selected = "Sepal.Length"),
        # Output widgets
        plotlyOutput("scatter"),
        textOutput("text")
))
