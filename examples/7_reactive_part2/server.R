library(shiny)
library(tidyverse)
library(plotly)

# Any variables or functions defined here are *loaded only once* when the app 
# is deployed to the web. They are accessible throughout the application
FACTOR_1 <- 3.3

shinyServer(function(input, output) {
    
    # Any variables or functions defined here are *loaded every time a user connects*
    FACTOR_2 <- 2.4
    
    # This is a reactive expression. Anytime the input$xvar value changes, mydf
    # will also change, triggering an update in anything that calls it
    mydf <- reactive({
        data.frame(
            val=iris[[input$xvar]] * FACTOR_1 + FACTOR_2
        )
    })
    
    # Observe is a reactive block that doesn't return anything, it just watches
    # for a change in any reactive elements in its definition
    observe({
        input$gear
        print("You changed gear!")
        
    })
    
    output$histogram <- renderPlot({
        mydf() %>%
            ggplot(aes(x=val)) +
                geom_histogram()
    })
    
    output$density <- renderPlot({
        mydf() %>%
            ggplot(aes(x=val)) +
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
