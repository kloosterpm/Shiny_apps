# This is the back end file.


size.icc.power = function(icc1, icc0, k, power, alpha) {
    
    z_alpha = qnorm(1 - alpha/2)
    
    z_beta = qnorm(power)
    
    theta0 = icc0 / (1-icc0)
    
    theta = icc1 / (1-icc1)
    
    c0 = (1 + k * theta0) / (1 + k * theta)
    
    n = ceiling(1 + (2 * ((z_alpha + z_beta)^2) * k) / (((log(c0))^2) * (k - 1)))
    
    
    return(n)
}



shinyServer(
    
    function(input, output) {
        output$estimation <- renderText({size.icc.power(input$icc1, input$icc0, input$k, input$power, input$alpha)})
        
    }
    
    
    
)



