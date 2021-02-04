library(shiny)
library(shinydashboard)
library(ggplot2)

#Ejecuta el código momios.R Almacena los gráficos resultantes en formato png 
#Crea un dashboard donde se muestren los resultados con 4 pestañas:

ui <- fluidPage(
    dashboardPage(
        dashboardHeader(title = "Estimacion de resultados"),
        dashboardSidebar(
            sidebarMenu(
                menuItem("Graficos de barras", tabName = "Dashboard", icon = icon("dashboard")),
                menuItem("Goles de casa y visitante", tabName = "Goles", icon = icon("table")),
                menuItem("Ganancia", tabName = "momios", icon = icon("file-picture-o"))
            )
        ),
        dashboardBody(
            tabItem(
                tabName = "Dashboard", fluidRow(
                    titlePanel("Goles por equipo"),
                    selectInput("x", "Seleccione valor de x", choices = c("home.score","away.score")),
                    plotOutput("plot1", height = 450, width = 700)
                )
            ),
            tabItem(
                tabName = "goles", fluidRow(
                    titlePanel(h4("Probabilidades de goles")),
                    img(src = "casa.png"),
                    img(src = "visit.png"),
                    img(src = "heatmap.png")
                )
            ),
            tabItem(tabName = "data_table", fluidRow(
                titlePanel(h4("Data Table")),
                dataTableOutput("data_table")
                )
            ),
            tabItem(tabName = "momios", fluidRow(
                titlePanel(h4("Imagen de calor")),
                h4("Factor de ganancia maximo"),
                img(src = "max.png", height = 350, width = 600),
                h4("Factor de ganancia promedio"),
                img(src = "prom.png", height = 350, width = 600)
                )    
            )
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        data <-  read.csv("../match.data.csv", header = T)	
        
        data <- mutate(data, FTR = ifelse(home.score > away.score, "H", ifelse(home.score < away.score, "A", "D")))	
        
        x <- data[,input$x]	
        
        #summary(data)	
        data %>% ggplot(aes(x, fill = FTR)) + 	
            geom_bar() + 	
            facet_wrap("away.team") +	
            labs(x =input$x, y = "Goles") + 	
            ylim(0,50)	
        
        
    })	
    
    # Gráficas de dispersión	
    output$output_momios <- renderPlot({ 	
        
        ggplot(mtcars, aes(x =  mtcars[,input$a] , y = mtcars[,input$y], 	
                           colour = mtcars[,input$z] )) + 	
            geom_point() +	
            ylab(input$y) +	
            xlab(input$x) + 	
            theme_linedraw() + 	
            facet_grid(input$z)  #selección del grid
    })
    
    #Data Table	
    output$data_table <- renderDataTable( {data}, 	
                                          options = list(aLengthMenu = c(10,25,50),	
                                                         iDisplayLength = 10)	
    )	
}

# Run the application 
shinyApp(ui = ui, server = server)
