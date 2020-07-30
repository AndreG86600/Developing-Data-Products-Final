library(shiny)

shinyUI(
    navbarPage("Just a Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The relationship between variables and Ozone"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Numeric Ozone (ppb)" = "Ozone",
                                                  "Numeric Solar R (lang)" = "Solar.R",
                                                  "Numeric Wind (mph)" = "Wind",
                                                  "Numeric Temperature (degrees F)" = "Temp",
                                                  "Numeric Month (1--12)" = "Month",
                                                  "Numeric Day of Month(1--31" = "Day"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("OzoneBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("OzonePlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Documentation",
                        h2("Instructions"),
                        hr(),
                        helpText(" The dataset contains daily air quality measurements in New York, May to September 1973. You can observe how the pozone level influences other variables such as temperature or wind.",
                                 "In order to do that just select the variable in the drop down menu and a correlation plot of ozone level vs. selected variable will appear."),


               )
    )
)