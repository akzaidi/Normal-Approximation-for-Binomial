library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Normal Approximation of Binomial Data"),
  
  # Sidebar with a slider input for the number of bins
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
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))