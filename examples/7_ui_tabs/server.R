library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$histogram <- renderPlot({
        iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            ggplot(aes(x=chosen)) +
                geom_histogram() +
                xlab(input$xvar)
    })
    
    output$density <- renderPlot({
        iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            ggplot(aes(x=chosen)) +
                geom_density() +
                xlab(input$xvar)
    })
    
})
