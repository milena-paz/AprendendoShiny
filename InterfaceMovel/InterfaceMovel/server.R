library(shiny)
library(ggplot2)

function(input, output, session) {
  thematic::thematic_shiny()
  
  df <- eventReactive(input$button, {
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="red") +
      theme(
        plot.background = element_blank(),
        axis.text = element_text(size=10),
        axis.ticks = element_line(),
        axis.title= element_text(size=15)
      )
  })
  output$plot1 <- renderPlot(df(),bg="transparent")
}
