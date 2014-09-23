library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Normal Approximation of Binomial Data"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("p",
                  "Probability of Success:",
                  min = 0,
                  max = 1,
                  step = 0.05,
                  value = 0.5),
      sliderInput("s",
                  "Number of throws per experiment:",
                  min = 1,
                  max = 250,
                  step = 1,
                  value = 20),
      sliderInput("n",
                  "Number of experiments:",
                  min = 100,
                  max = 10^4,
                  step = 100,
                  value = 100)
      
    ),
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
