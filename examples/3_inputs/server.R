library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$scatter <- renderPlotly({
        
        # input$xvar refers to the UI radio button, every time a different option is clicked
        # this renderPlotly expression is reevaluated
        # `sym` just converts the input string into a 'symbol' like `ggplot2` requires
        xinput <- sym(input$xvar)
        
        p <- iris %>%
            ggplot(aes(x=!!xinput, y=Petal.Length)) +
                geom_point() +
                geom_smooth()
        plotly::ggplotly(p)
    })
    
    output$text <- renderText(
        sprintf("You chose %s", input$xvar)
    )
    
})
