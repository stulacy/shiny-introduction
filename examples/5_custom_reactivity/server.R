library(shiny)
library(tidyverse)
library(plotly)

shinyServer(function(input, output) {
    
    transformed_df <- reactive({
        # Return the object that needs to be made reactive much like
        # a normal function call
        iris %>%
            rename(chosen = one_of(input$xvar)) %>%
            mutate(chosen = case_when(
                input$transform == "None" ~ chosen,
                input$transform == "Squared" ~ chosen**2,
                input$transform == "Log" ~ log(chosen)
            ))
    })
    
    output$scatter <- renderPlotly({
        # Now both plots use the 'transformed_df' reactive data frame.
        # Note the () like it's a function call rather than accessing a data frame
        p <- transformed_df() %>%
            ggplot(aes(x=chosen, y=Petal.Length)) +
                geom_point() +
                geom_smooth() 
        plotly::ggplotly(p)
    })
    
    output$density <- renderPlotly({
        p <- transformed_df() %>%
            ggplot(aes(x=chosen)) +
                geom_density() 
        plotly::ggplotly(p)
    })
    
})