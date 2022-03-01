library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$text <- renderText({
        sprintf("Now displaying %s", input$xvar)
    })
    
    output$scatter <- renderPlotly({
        # input$xvar refers to the UI radio button, every time a different option is clicked
        # this renderPlotly expression is reevaluated
        p <- iris %>%
            rename(chosen = one_of(input$xvar)) %>% 
            ggplot(aes(x=chosen, y=Petal.Length)) +
                geom_point() +
                geom_smooth() +
                xlab(input$xvar)
        plotly::ggplotly(p)
    })
    
})
