# This is the back end file.


size.cronbach.precision = function(alpha, k, w, cronbach) {
    # alpha: alpha value for 1-alpha confidence (e.g., alpha = 0.05 for 95% confidence interval)
    # k: number of items
    # w: desired with of the confidence interval
    # cronbach: expected (planned) Cronbach alpha reliability value
    # Returns required sample size
    z = qnorm(1 - alpha/2)
    n0 = ceiling((8 * k / (k - 1)) * (1 - cronbach)^2 * (z / w)^2 + 2)
    b = log(n0 / (n0 - 1))
    LL = 1 - exp(log(1 - cronbach) - b + z*sqrt(2 * k /  ((k - 1) * (n0 - 2))))
    UL = 1 - exp(log(1 - cronbach) - b - z*sqrt(2 * k /  ((k - 1) * (n0 - 2))))
    w0 = UL - LL
    n = ceiling((n0 - 2) * (w0/w)^2 + 2)
    return (n)
}



shinyServer(
    
    function(input, output) {
        output$estimation <- renderText({size.cronbach.precision(input$alpha, input$k, input$w, input$cronbach)})
        
    }
    
    
    
)



