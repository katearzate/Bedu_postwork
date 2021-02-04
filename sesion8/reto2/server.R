library(shiny)

# dashboard dinámico que muestre de manera dinámica histogramas

shinyServer(function(input, output) {
    
    datasetImput <- reactive(
        switch(input$dataset, 
               "airquality" = airquality[,1:6], 
               "diamonds" = as.data.frame(diamonds[,c("carat","depth", "price") ]), 
               "midwest" = as.data.frame(midwest[,4:11]) )
    )
    
    output$var <- renderUI({
        
        radioButtons("varname", 
                     "elige una variable", 
                     names(datasetImput()))
    })
    
    output$plot <- renderPlot({
        if(!is.null(input$varname)){
            if(!input$varname %in% names(datasetImput())){
                colname <- names(datasetImput())[1]
                
            } else {
                colname <- input$varname
            }
            hist(datasetImput()[,colname],
                 main = paste("Histograma de", colname), 
                 xlab = colname)
        }
        
    })
    
})