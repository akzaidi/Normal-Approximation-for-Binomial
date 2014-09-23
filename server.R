library(shiny)
library(ggplot2)
library(scales)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    x    <- rbinom(input$n, input$s, input$p)
    #     bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #     hist(x, breaks = bins, col = 'skyblue', border = 'white')
    
    bin.df <- data.frame(x = x)
    
    title <- paste("Normal Distribution Approximation for", input$n,
                   "Observations of a Binomial Random Variable with p =", input$p, "and flips =", input$s, sep = " ")
    
    g <- ggplot(bin.df, aes(x = x)) +   
      geom_histogram(aes(y = ..density..), binwidth = 1, alpha = 0.4) +   
      stat_function(fun = dnorm, n = 10^4, geom = 'path', position = 'identity',
                    args = c(mean = input$p*input$s, sd = sqrt(input$s*input$p*(1-input$p)))) + 
      scale_x_continuous(limits = c(input$p*input$s - 3*sqrt(input$s*input$p*(1-input$p)), input$p*input$s + 3*sqrt(input$s*input$p*(1-input$p)))) +
      scale_y_continuous(expand = c(0, 0), label = percent) + ylab("Percentage of Observations") + 
      xlab("Number of Successes in Binomial Trial") + ggtitle(title)
    
    g
      
  })
})