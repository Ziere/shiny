library(shiny)
library(ggplot2)

dataset <- mtcars

shinyUI(pageWithSidebar(
  
  headerPanel("Car comparison explorer"),
  
  sidebarPanel(
    
    #sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
    #            value=min(1000, nrow(dataset)), step=500, round=0),
    
    selectInput('car1', 'Car', rownames(dataset)),
    selectInput('car2', 'Car', rownames(dataset), rownames(dataset)[[3]]),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),  
    
    sliderInput('textSize', 'Text Size', min=1, max=20,
                value=10, step=1, round=0)
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))