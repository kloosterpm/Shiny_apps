# This is the front end file.


shinyUI(pageWithSidebar(
    
    headerPanel("Required sample size for Cronbach alpha value with desired precision (confidence interval around alpha)"),
    
    sidebarPanel(
        
        numericInput('alpha', 'alpha value (for 1-alpha confidence interval)', 0.05, min = 0, max = 1, step = 0.01),
        
        numericInput('k', 'Number of items', 7, min = 0, max = 999, step = 1),
        
        numericInput('w', 'Desired width of the confidence interval (w)', 0.1, min = 0, max = 1, step = 0.01),
        
        numericInput('cronbach', 'Expected value of Cronbach alpha', 0.80, min = 0, max = 1, step = 0.01)
        

    ),
    
    mainPanel(
        
        verbatimTextOutput("obeta"),
        
        h4('Required sample size (n):'),
        
        verbatimTextOutput("estimation"),
        
        h6('Approximate number of subjects required to obtain a confidence interval 
            of the desired width around a specified Cronbach alpha value.'),
        
        br(),
        
        h6('For example: for an expected Cronbach alpha of 0.80 for a (sub-)scale of 7 items, 
           147 subjects are needed to o obtain a desired width of 0.1 for a 95% confidence 
           interval (i.e., the value of Cronbach alpha is between 0.75 and 0.85).'),
        
        br(),
        
        h5('References:'),
        
        h6('Bonett DG. Sample size requirements for testing and estimating coefficient alpha. J Educ Behav Stat. 2002;27(4):335–40.'),
        h6('Bonett DG, Wright TA. Cronbachs alpha reliability: Interval estimation, hypothesis testing, and sample size planning. J Organ Behav. 2015;36(1):3–15.')
        
        
    )
    
))