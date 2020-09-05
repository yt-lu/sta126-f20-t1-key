#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(ISLR)


server <- function(input, output){
  
  # Creating numerical data
  userdata <- reactive({
    # Plant the random number seed
    if (is.na(input$id)){
      userdata <- data.frame(wage=NULL)
      return(userdata)
    }else{
      set.seed(input$id) 
      userdata <- sample(Wage$wage, 50) * 1000
      return(userdata)
    }
  }) # end reactive
  
  
  
  # Output: Textblock 1 ----
  output$text <- renderText({
    x <- round(userdata(), 2)
    out <- paste0("<br><span style='font-size:16pt;'>A random sample of 100 salaries:</span><br><br>", 
      paste(round(userdata(), 2), collapse = ", "), 
      "<br><br><ul><li>90th percentile: <b>", quantile(x, 0.9, type = 2), "</b></li>",
      "<li>Five-number summary: <b>", paste(fivenum(x), collapse = ", "), "</b></li>",
      "<li>IQR: <b>", IQR(x), "</b></li>",
      "<li>Fences: <b>", quantile(x, 0.25, type = 2) - 1.5 * IQR(x), "   ", 
      quantile(x, 0.75, type = 2) + 1.5 * IQR(x), "</b></li></ul>"
    )
    out
  })
  
  output$graph <- renderPlot({
    boxplot(round(userdata(), 2), horizontal = T)
    
  })
  
} #end server
