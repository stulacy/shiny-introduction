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
    
})
