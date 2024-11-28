
box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, uiOutput],
)

box::use(
  app / view
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  view$ui(ns("view"))
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    view$server("view")
  })
}