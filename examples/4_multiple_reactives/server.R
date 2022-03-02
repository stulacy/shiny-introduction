library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    output$scatter <- renderPlotly({
        # input$xvar refers to the UI radio button, every time a different option is clicked
        # this renderPlotly expression is reevaluated
        p <- iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            mutate(chosen = case_when(
                input$transform == "None" ~ chosen,
                input$transform == "Squared" ~ chosen**2,
                input$transform == "Log" ~ log(chosen)
            )) %>%
            ggplot(aes(x=chosen, y=Petal.Length)) +
                geom_point() +
                xlab(sprintf("%s with %s transform", input$xvar, input$transform)) +
                geom_smooth() 
        plotly::ggplotly(p)
    })
    
    output$density <- renderPlotly({
        p <- iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            mutate(chosen = case_when(
                input$transform == "None" ~ chosen,
                input$transform == "Squared" ~ chosen**2,
                input$transform == "Log" ~ log(chosen)
            )) %>%
            ggplot(aes(x=chosen)) +
                geom_density() +
                xlab(sprintf("%s with %s transform", input$xvar, input$transform)) 
        plotly::ggplotly(p)
    })
    
})