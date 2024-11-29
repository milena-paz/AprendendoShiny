library(shiny)
library(ggplot2)

function(input, output, session) {

  df <- eventReactive(input$button, {
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="black") +
      theme(
        panel.background = element_rect(fill='#e0afbb'),
        plot.background = element_rect(fill='#733b4c', color=NA),
        axis.text = element_text(color="#000000",size=10),
        axis.ticks = element_line(color="#000000"),
        axis.title= element_text(size=15)
      )
  })
  output$plot1 <- renderPlot(df())
}
