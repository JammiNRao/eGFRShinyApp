library(shiny)

egfr <- function(age=60, creat = 100, sex=1, black=1){
                return(186*(creat/88.4)^-1.154*age^-0.203*sex*black)                
        }

shinyServer(function(input,output){
        
        output$text1 <- renderText({ 
                paste("You entered your age as ", input$age)
                })
        output$text2 <- renderText({
                paste("Your plasma creatinine is", input$cr)
                })
        output$predegfr <- renderText({
                        round(egfr(input$age,input$cr,as.numeric(input$sex),as.numeric(input$black)), 0)
                })
        }
)
