library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$output_text <- renderText({
        paste("Grafico de Sepal.Length ~", input$x)
    }) #Titulo del main Panel
    
    output$output_plot <- renderPlot({
        plot(as.formula(paste("Sepal.Length ~", input$x)), data = iris) 
    }) #Gráficos de salida
    
    output$summary <- renderPrint({
        summary(iris)
    })   # Summary
    
    output$table <- renderTable({ 
        data.frame(iris)
    })   # Data Frame
    
    output$datatable <- renderDataTable({
        iris
    }  #Data table
    options = list(aLengthMenu = c(10,20,50), iDisplayLength = 10) ) 
})
