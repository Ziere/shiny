library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive(function() {
    mtcars[c(input$car1,input$car2),]
  })
  
  output$plot <- renderPlot(function() {
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point(colour = "red", size = 3)
    
    p <- p + geom_text(label=c(input$car1,input$car2),size=input$textSize)
    
    print(p)
    
  }, height=500)
  
})