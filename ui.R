## Developing Data Products Project
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("MPG prediction using Motor Trend Cars Dataset"),
  sidebarPanel(
    h3('Please choose your input values'),
    numericInput('weight', 'Weight (lb/1000)', 3.0, min = 1.5, max = 5.5, step = 0.5),
    selectInput("transmission", "Transmission", choices = c("automatic", "manual")),
    selectInput("cylinder", "Number of cylinders", choices = c(4, 6, 8)),
    submitButton('Submit')
    
  ),
  mainPanel(
    h3('Predicted Miles/Gallon'),
    h4('You chose transmission type'),
    verbatimTextOutput("am"),
    h4('You entered weight in 1000 lb'),
    verbatimTextOutput("wt"),
    h4('You chose number of cylinders'),
    verbatimTextOutput("cyl"),
    h4('Which resulted in a prediction of Miles/Gallon'),
    verbatimTextOutput("prediction")
  )
))


