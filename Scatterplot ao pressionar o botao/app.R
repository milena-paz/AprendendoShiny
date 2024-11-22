
library(shiny)
library(ggplot2)

shinyApp(
  ui = fluidPage(titlePanel(title="Gráfico de dispersão usando ggplot2"),
           br(),
           sidebarPanel(
              selectInput("x","Variavel 1", choices=c("mpg","wt","hp","qsec")),
              selectInput("y","Variavel 2", choices=c("mpg","wt","hp","qsec")),
              actionButton("button", "Mostrar plot"),
              HTML("<br><br> mpg - Miles/(US) gallon<br>
              hp - Gross horsepower<br>
              wt - Weight (1000 lbs)<br>qsec - 1/4 mile time")
              ),
           mainPanel(
             plotOutput("plot1"))
  ),
  server = function(input, output) {
    observeEvent(input$button, {
      cat("Showing", input$name, "plot\n")
    })
    #faz o plot só quando o botao e pressionado
    df <- eventReactive(input$button, {
      ggplot(data=mtcars,aes(x=.data[[input$x]],y=.data[[input$y]])) + geom_point(col="blue")
    })
    output$plot1 <- renderPlot ( df() )
  }
)
