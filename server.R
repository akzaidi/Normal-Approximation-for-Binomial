library(shiny)
library(ggplot2)
library(scales)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    
    x    <- rbinom(input$n, input$s, input$p)
    
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
