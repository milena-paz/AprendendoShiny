library(shiny)
library(shinyMobile)

f7Page(
    options = list(theme = "md", color="#917bd1"),
    f7SingleLayout(
      f7Select(
          "x","Variável 1",
  	      choices=c("mpg","wt","hp","qsec"),
  	      style=list(outline=T)
        ),
      f7Select(
          "y","Variável 2",
        	choices=c("mpg","wt","hp","qsec"),
        	style=list(outline=T)
        ),
      f7Button(
          "button", "Mostrar plot",
          rounded=T,
          size="large"
        ),
      br(),
      plotOutput("plot1"),
      navbar=f7Navbar(title="App-Teste: Interface Móvel")
    )
)
