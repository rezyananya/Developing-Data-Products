# I have used Prestige data for my predictive model

library(shiny)
library(car)
data("Prestige")
library(dplyr)
library(ggplot2)


# Define server logic required to draw respective plot
shinyServer(function(input, output) {
  model <- lm(income ~ education, data = Prestige)
  
  modelpred <- reactive({
    eduinput <- input$slideredu
    predict(model,newdata = data.frame(education = eduinput))
  })
  
  output$Plot1 <- renderPlot({
    eduinput <- input$slideredu
    plot(Prestige$income,xlab = "education",main = "Income increases with Education",
         ylab = "income",bty = "n",pch = 20,
         xlim = c(1,50),ylim = c(100,30000))
    if(input$showModel){
      abline(model,col = "blue",lwd = 2)
    }
    
    legend(25,150,c("Model Prediction"),pch = 20,
           col = c("red"),bty = "n",cex = 2.5)
    points(eduinput,modelpred(),col = "red",pch = 20,cex = 2.5)
  })
  output$pred1 <- renderText({
    modelpred()
    
  })
})
