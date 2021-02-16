library(shiny)

shinyUI(
    
    # This is the container for all the UI elements
    fluidPage(
        
        # Application title
        titlePanel("Example 1 - Basic app"),
        
        # The 'scatter' and 'table' are the IDs of these outputs that must be referenced
        # in server.R
        plotOutput("scatter"),
        tableOutput("table")
))
