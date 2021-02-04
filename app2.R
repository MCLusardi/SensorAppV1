####################################
# Data Professor                   #
# http://youtube.com/dataprofessor #
# http://github.com/dataprofessor  #
####################################

# Modified from https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/

library(shiny)
data(airquality)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Ozone Level"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 0,
                  max = 100,
                  value = 30,
                  step = 5)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
#object distplot is how output is displayed
  output$distPlot <- renderPlot({
    #define data for the x axis
    x    <- airquality$Ozone
    #omit na data
    x    <- na.omit(x)
    #reads the number of bins from input to determine the number of bins for output
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    #actually building the histogram
    hist(x, breaks = bins, col = "#00AA00", border = "black",
         xlab = "Ozone levels",
         main = "Mode of Ozone level")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
