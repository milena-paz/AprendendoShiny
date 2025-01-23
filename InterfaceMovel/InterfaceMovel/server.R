library(shiny)
library(ggplot2)

function(input, output, session) {

  df <- eventReactive(input$button, {
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="red") +
      theme(
        axis.text = element_text(size=10),
        axis.ticks = element_line(),
        axis.title= element_text(size=15)
      )
  })
  output$plot1 <- renderPlot(df(), bg="transparent")
}
