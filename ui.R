#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws respective plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Income from Education"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("slideredu",
                  "Slide me to get what will be the income?:",
                  min = 5.5,
                  max = 20.5,
                  value = 20.5),
      checkboxInput("showModel","Tick me to Show/Hide Model",value = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("Plot1"),
      h3("Predicted income from model:"),
      textOutput("pred1")
      
    )
  )
))
