box::use(
  shiny[moduleServer, NS, renderUI, tags,
        eventReactive,
        renderPlot,
        plotOutput],
  datasets[mtcars],
  ggplot2[ggplot,aes,geom_point],
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  plotOutput(ns("plot1"))
}

#' @export
server <- function(id, x ,y) {
  moduleServer(id, function(input, output, session) {
     
    output$plot1 <- renderPlot ({
      ggplot(data=mtcars,aes(x=.data[[x]],y=.data[[y]])) + geom_point(col="blue")
      })
    
  })
}