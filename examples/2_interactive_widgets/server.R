library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    # Note that the render functions have changed from example 1
    output$scatter <- renderPlotly({
        p <- iris %>%
            ggplot(aes(x=Sepal.Length, y=Petal.Length)) +
                geom_point() +
                geom_smooth()
        # Rather than directly return the ggplot object, it is now wrapped in a plotly function
        ggplotly(p)
    })
    
    output$table <- renderDataTable({
        iris
    })
})
