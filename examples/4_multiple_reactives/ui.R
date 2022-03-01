library(shiny)
library(plotly)

shinyUI(
    fluidPage(
        titlePanel("Example 4 - Multiple Reactives"),
        # Output widgets
        plotlyOutput("scatter", height="200px", width="800px"),
        plotlyOutput("density", height="200px", width="800px"),
        br(),
        # Input widgets
        radioButtons("xvar", "Select x variable", 
                     choices=c("Sepal.Length",
                               "Sepal.Width",
                               "Petal.Width"),
                     selected = "Sepal.Length"),
        selectInput("transform", "Transformation:",
                    choices=c("None", "Squared", "Log"))
))