library(shiny)
library(plotly)

shinyUI(
    # Previously we used a 'fluidPage' as the top level page container. That just provided a single page app
    # navbarPage allows for multiple pages
    navbarPage("Example 6 - UI Pages",
               # Each tabPanel contains a completely new environment with its own UI elements.
               # Even for this simple app, this code is already getting quite cluttered and hard to follow!
               # You can write each tabPanel in its own file and refer to them here with `source`
               tabPanel("iris",
                        sidebarLayout(
                            sidebarPanel(
                                radioButtons("xvar", "Select variable", 
                                             choices=c("Sepal.Length",
                                                       "Sepal.Width",
                                                       "Petal.Width")
                                )
                            ),
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
               ),
               tabPanel("mtcars",
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("gear", 
                                            "Number of gears", 
                                            min=3,
                                            max=5,
                                            value=4
                                )
                            ),
                            mainPanel(
                                plotOutput("cars_scatter")
                            )
                        )
               )
))
