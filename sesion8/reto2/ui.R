library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Elecciones dinamicas de Data Frames"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("dataset", "Seleccion del dataset", 
                        c("airquality", "diamonds", "midwest")), 
            uiOutput("var")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(plotOutput("plot")
        )
    )
))