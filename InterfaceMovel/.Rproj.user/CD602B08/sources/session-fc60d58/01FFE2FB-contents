library(shiny)
library(ggplot2)

function(input, output, session) {

  observeEvent(input$button, {
    output$plot1 <- renderPlot({
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="blue")
      })
  })

}
