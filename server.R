## Shiny server file
mpg_model <- function(weight, transmission, cylinder){
  if (transmission == "automatic") trans = 0
  if (transmission == "manual") trans = 1
  model = lm(mpg~wt+am+as.factor(cyl)+wt:am,data=mtcars)
  a = data.frame(wt=weight, am=trans, cyl=as.factor(cylinder))
  predict(model, a)+5
}
library(shiny)
shinyServer(
  function(input, output) {
    output$am <- renderPrint({input$transmission})
    output$wt <- renderPrint({input$weight})
    output$cyl <- renderPrint({input$cylinder})
    output$prediction <- renderPrint({mpg_model(input$weight, 
                        input$transmission, input$cylinder)})
  }
)