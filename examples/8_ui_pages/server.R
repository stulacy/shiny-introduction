library(shiny)
library(tidyverse)
library(plotly)


shinyServer(function(input, output) {
    # Note there's no differentiation here between outputs for each page.
    # If you have a lot of pages and logic, it can be hard to nvagiate, so again
    # I'd suggest creating a server file per page.
    
    ##### Iris page
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
    
    ##### mtcars page
    output$cars_scatter <- renderPlot({
        mtcars %>%
            filter(gear == input$gear) %>%
            ggplot(aes(x=hp, y=mpg)) +
                geom_point() +
                geom_smooth(method="lm")
    })
    
})
