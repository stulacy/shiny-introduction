library(shiny)
library(shinydashboard)
library(plotly)

shinyUI(dashboardPage(
    dashboardHeader(title = "Example 9 - Shinydashboard"),
    dashboardSidebar(sidebarMenu(
        menuItem("iris", tabName = "iris", icon = icon("dashboard")),
        menuItem("mtcars", tabName = "mtcars", icon = icon("th"))
    )),
    dashboardBody(tabItems(
        # iris page
        tabItem(tabName = "iris",
                fluidRow(
                    box(plotOutput("histogram"),
                        solidHeader = TRUE,
                        title="Histogram",
                        status="success"),
                    box(plotOutput("density"),
                        solidHeader = TRUE,
                        title="Density",
                        status="warning")
                ),
                fluidRow(
                    column(
                        box(radioButtons(
                        "xvar",
                        "Select variable",
                        choices = c("Sepal.Length",
                                    "Sepal.Width",
                                    "Petal.Width")
                        ),
                        width = 12,
                        status="primary",
                        align="center"),
                        width = 4, offset = 4
                    )
                )
        ),
        # mtcars page
        tabItem(tabName = "mtcars",
                fluidRow(box(
                    sliderInput(
                        "gear",
                        "Number of gears",
                        min = 3,
                        max = 5,
                        value = 4
                    ),
                    width=3
                ),
                box(plotOutput("cars_scatter"), width=9)))
    ))
))
