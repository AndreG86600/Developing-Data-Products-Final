library(shiny)
library(datasets)

airData <- airquality

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("Ozone ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("Ozone ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=airData)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$OzoneBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = airData,
                outline = input$outliers)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$OzonePlot <- renderPlot({
        with(airData, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    
})