library(shiny)
library(shinydashboard)
library(shinythemes)

#Ejecuta el código momios.R Almacena los gráficos resultantes en formato png 
#Crea un dashboard donde se muestren los resultados con 4 pestañas:

ui <- fluidPage(
    dashboardPage(
        dashboardHeader(title = "Resultados"),
        dashboardSidebar(
            sidebarMenu(
                menuItem("Integrantes del equipo", tabName = "integrantes", icon = icon("list-alt")),
                menuItem("Graficos de barras", tabName = "Dashboard", icon = icon("dashboard")),
                menuItem("Goles de casa y visitante", tabName = "Goles", icon = icon("area-chart")),
                menuItem("Fichero", tabName = "data_table", icon = icon("table")),
                menuItem("Ganancia", tabName = "momios", icon = icon("file-picture-o"))
            )
        ),
        
        dashboardBody(
            tabItems(
                
                #INTEGRANTES DEL EQUIPO
                tabItem(
                    tabName = "integrantes", fluidRow(
                        box(titlePanel("Equipo 16"),
                        h3("Integrantes:"),
                        p(
                            h4("Katherine Arzate Serrano"),
                            h4("Jacob Hernandez Mejía"),
                            h4("Luis Donaldo Romero Tapía"),
                            h4("Sergio Esteban Camacho Paez"),
                        )
                        )
                    ) 
                ),
                
                #1. Una con las gráficas de barras, donde en el eje de las x se muestran los goles de local 
                #y visitante con un menú de selección, con una geometría de tipo barras además de hacer un 
                #facet_wrap con el equipo visitante
                tabItem(
                    tabName = "Dashboard", fluidRow(
                        titlePanel("Goles por equipo"),
                        selectInput("x", "Seleccione valor en x", choices = c("Puntuacion de Casa" = "home.score", "Puntuacion de Visitante" ="away.score")),
                        plotOutput("plot1", height = 450, width = 800)
                    )
                ),
                
                #2. imágenes de las gráficas del postwork 3
                tabItem(
                    tabName = "Goles", fluidRow(
                        titlePanel(h2("Probabilidades de goles")),
                        h4("De casa"),
                        img(src = "casa.png", height = 350, width = 480, alt = "goles de casa"),
                        h4("De visitante"),
                        img(src = "visitante.png", height = 350, width = 480, alt = "goles de visitante"),
                        h4(""),
                        img(src = "heatmap.png", height = 350, width = 480, alt = "heatmap de ambos equipos")
                    )
                ),
                
                #3. datatable del fichero match.data.csv
                tabItem(
                    tabName = "data_table", fluidRow(
                        titlePanel(h4("Data Table")),
                        dataTableOutput("data_table")
                    )
                ),
                
                #4. imágenes de las gráficas de los factores de ganancia mínimo y máximo
                tabItem(
                    tabName = "momios", fluidRow(
                        titlePanel(h2("Factores de ganancia")),
                        h4("Factor de ganancia maximo"),
                        img(src = "maximos.png", height = 350, width = 500, alt = "ganancia maximos"),
                        h4("Factor de ganancia promedio"),
                        img(src = "promedio.png", height = 350, width = 500, alt = "ganancia promedio")
                    )    
                )
            
            )#fin de tabItems
        )#fin de dashboardBody
    
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    library(ggplot2)
    library(dplyr)
    
    #Gráfico de barras 
    output$plot1 <- renderPlot({
        datos <- read.csv("match.data.csv", header = T)
        x <- datos[,input$x]
        datos %>% ggplot(aes(x)) + 	
            geom_bar() + 	
            facet_wrap("away.team") +	
            labs(x =input$x, y = "Goles")
    })
    
    #Data Table
    output$data_table <- renderDataTable( {read.csv("match.data.csv", header = T)}, 
                                          options = list(aLengthMenu = c(5,25,50),
                                                         iDisplayLength = 5)
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
