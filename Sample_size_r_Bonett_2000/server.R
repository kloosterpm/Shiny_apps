# This is the back end file.


size.ci.cor = function(alpha, cor, s, w) {
    # Computes sample size required to estimate a (partial) correlation
    # with desired precision
    # Arguments: 
    #   alpha: alpha value for 1-alpha confidence
    #   cor:   planning value of (partial) correlation
    #   s:     number of control variables
    #   w:     desired confidence interval width
    # Returns:
    #   required sample size
    z <- qnorm(1 - alpha/2)
    n1 <- ceiling(4*(1 - cor^2)^2*(z/w)^2 + s + 3)
    zr <- log((1 + cor)/(1 - cor))/2
    se <- sqrt(1/(n1 - s - 3))
    ll0 <- zr - z*se
    ul0 <- zr + z*se
    ll <- (exp(2*ll0) - 1)/(exp(2*ll0) + 1)
    ul <- (exp(2*ul0) - 1)/(exp(2*ul0) + 1)
    n <- ceiling((n1 - s - 3)*((ul - ll)/w)^2 + 3 + s)
    return(n)
}

size.ci.cor(.05, .362, 0, .25)


shinyServer(
    
    function(input, output) {
        output$estimation <- renderText({size.ci.cor(input$alpha, input$cor, input$s, input$w)})
        
    }
    
    
    
)



