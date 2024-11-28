box::use(
  
  shiny[NS,
        moduleServer,
        fluidPage,
        titlePanel,
        br,
        sidebarPanel,
        selectInput,
        actionButton,
        HTML,
        mainPanel,
        plotOutput,
        observeEvent],
)

box::use(
  app / view / plot1
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(titlePanel(title="Gráfico de dispersão usando ggplot2"),
            br(),
            sidebarPanel(
              selectInput(ns("x"),"Variável 1", choices=c("mpg","wt","hp","qsec")),
              selectInput(ns("y"),"Variável 2", choices=c("mpg","wt","hp","qsec")),
              actionButton(ns("button"), "Mostrar plot"),
              HTML("<br><br> mpg - Miles/(US) gallon<br>
              hp - Gross horsepower<br>
              wt - Weight (1000 lbs)<br>qsec - 1/4 mile time")
            ),
            mainPanel(
              plot1$ui(ns("plot1"))
            )
  )
}
#' @export

server <- function(id){
  moduleServer(id, function(input, output, session){
    observeEvent(input$button,plot1$server("plot1",input$x,input$y))
  })
}