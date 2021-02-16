library(shiny)
library(tidyverse)

shinyServer(function(input, output) {
    output$scatter <- renderPlot({
        iris %>%
            ggplot(aes(x=Sepal.Length, y=Petal.Length)) +
                geom_point() +
                geom_smooth()
    })
    
    output$table <- renderTable({
        iris
    })
})
