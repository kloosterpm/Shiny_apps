# This is the back end file.


ASS = function(k,ICC,width){
    
    return(ceiling(((8 * (1.96^2) * (1-ICC)^2) * ((1+(k-1)*ICC) * (1+(k-1)*ICC))) / (k*(k-1)* ((width^2))) + 1))
}



shinyServer(
    
    function(input, output) {
        output$estimation <- renderText({ASS(input$k, input$ICC, input$width)})

    }
    
    

)

