# This is the front end file.


shinyUI(pageWithSidebar(
    
    headerPanel("Required sample size to estimate a (partial) Pearson correlation with desired precision"),
    
    sidebarPanel(
        
        numericInput('alpha', 'Alpha value (for 1 - alpha confidence)', 0.05, min = 0, max = 1, step = 0.01),
        
        numericInput('cor', 'Anticipated value of (partial) correlation', 0.80, min = 0, max = 1, step = 0.01),
        
        numericInput('s', 'Number of control variables', 0, min = 0, max = 999, step = 1),
        
        numericInput('w', 'Desired width of the confidence interval', 0.2, min = 0, max = 1, step = 0.01)
        
    ),
    
    mainPanel(
        
        verbatimTextOutput("obeta"),
        
        h4('Required sample size (n):'),
        
        verbatimTextOutput("estimation"),
        
        h6('Approximate number of subjects required to obtain a confidence interval of the desired 
           width for a planning estimate of the population (partial) Pearson correlation coefficient (r).
           Alpha = 0.05 translates to a 95% confidence interval, alpha = 0.01 to a 99% 
           confidence interval.'),
        
        br(),
        
        h6('Can be used to estimate the sample size (n) required to test a hypothesis 
            regarding the planned value of a Pearson correlation with desired power.  
            For example: for an expected Pearson r of 0.8, 56 subjects are needed to obtain a 
            desired 95% confidence interval width of 0.2 (i.e., the value of Pearson r is 
            between 0.7 and 0.9).'),

        br(),
        
        h5('Reference:'),
        
        h6('Bonett DG, Wright TA. Sample size requirements for estimating Pearson, Kendall and Spearman correlations. Psychometrika. 2000;65(1):23–8.')
        
        
    )
    
))