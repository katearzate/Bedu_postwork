#Dashboard con el dataset de 'iris'

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
    pageWithSidebar(
        
        headerPanel("Aplicacion simple de Shiny"),
        sidebarPanel(p("Vamos a crear plots con el dataset de 'iris'"),
                     selectInput("x", "Selecciona el eje de las X",
                                 choices = names(iris) )
                     
        ),
        
        mainPanel(
            tabsetPanel(
                
                tabPanel("Graficas", 
                         h3(textOutput("output_text")), 
                         plotOutput("output_plot") 
                ),
                
                tabPanel("Imagen",
                         img(src ="cor_mtcars.png", width = 450, height = 450)     
                ), 
                
                tabPanel("Summary", verbatimTextOutput("summary")),    # salida del Summary
                tabPanel("Table", tableOutput("table")),               # salida de la tabla
                tabPanel("Data Table", dataTableOutput("datatable"))   # salida del data table
                
                
            )
        ))
    
)
