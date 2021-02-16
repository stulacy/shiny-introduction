library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$histogram <- renderPlot({
        xinput <- sym(input$xvar)
        iris %>%
            ggplot(aes(x=!!xinput)) +
                geom_histogram()
    })
    
    output$density <- renderPlot({
        xinput <- sym(input$xvar)
        iris %>%
            ggplot(aes(x=!!xinput)) +
                geom_density()
    })
    
    # Note there's no differentiation here between outputs for each page.
    # If you have a lot of pages and logic, it can be hard to nvagiate, so again
    # I'd suggest creating a server file per page.
    output$cars_scatter <- renderPlot({
        mtcars %>%
            filter(gear == input$gear) %>%
            ggplot(aes(x=hp, y=mpg)) +
                geom_point() +
                geom_smooth(method="lm")
    })
    
})
