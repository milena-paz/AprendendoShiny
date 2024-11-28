library(shiny)
library(ggplot2)

function(input, output, session) {

  df <- eventReactive(input$button, {
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="blue")
  })
  output$plot1 <- renderPlot(df())
}
