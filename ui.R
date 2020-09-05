library(shiny)
library(DT)
library(ISLR)


ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                    * {
                    font-family: Palatino,garamond,serif;
                    font-weight: 500;
                    line-height: 1.2;
                    #color: #000000;
                    }
                    "))
    ),    
  # App title 
  titlePanel(title="STA126 Test 1 Data (Fall 2020)"),
  
  # Sidebar layout 
  sidebarLayout(
    
    # Sidebar objects
    sidebarPanel(
      
      numericInput(inputId = "id",
                   "Enter your MU ID", 
                   value=NULL),  
      
      # Sidebar width can not exceed 12, default 4.
      width = 4
    ), # end of sidebar panel
    
    # Main panel----
    mainPanel(
      
      tabsetPanel(
        tabPanel("Question 9", 
                 fluidRow(column(12, htmlOutput("text"))),
                 fluidRow(column(12, plotOutput("graph")))
                 )
        )#end of tabsetPanel
      
    ) #end of mainPanel
    
  ) #end of sidebarlayout
  
) #end of fluidpage
