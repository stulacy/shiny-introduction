library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$scatter <- renderPlotly({
        p <- iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            ggplot(aes(x=chosen, y=Petal.Length)) +
                geom_point() +
                geom_smooth() +
                xlab(input$xvar)
        plotly::ggplotly(p)
    })
    
    output$text <- renderText(
        sprintf("You chose %s", input$xvar)
    )
    
})
