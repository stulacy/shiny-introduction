library(shiny)
library(plotly)

shinyUI(
    fluidPage(
        titlePanel("Example 7 - UI Tabs"),
        
        sidebarLayout(
            sidebarPanel(
                radioButtons("xvar", "Select variable", 
                             choices=c("Sepal.Length",
                                       "Sepal.Width",
                                       "Petal.Width")
                )
            ),
            # The main panel can be split up into tabs
            mainPanel(
                tabsetPanel(
                    tabPanel("Histogram",
                             plotOutput("histogram")
                    ),
                    tabPanel("Density",
                             plotOutput("density")
                    )
                )
            )
        )
))
