library(shiny)
library(plotly)

shinyUI(
    fluidPage(
        titlePanel("Example 6 - UI Sidebar"),
        
        # Rather than directly adding the UI elements, we wrap them
        # in a sidebarLayout, which takes 2 arguments: a sidebarPanel and a mainPanel
        sidebarLayout(
            sidebarPanel(
                radioButtons("xvar", "Select x variable", 
                             choices=c("Sepal.Length",
                                       "Sepal.Width",
                                       "Petal.Width")
                )
            ),
            mainPanel(
                plotlyOutput("scatter"),
                textOutput("text")
            )
        )
))
