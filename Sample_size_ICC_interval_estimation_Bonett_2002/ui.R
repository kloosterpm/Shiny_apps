# This is the front end file.


shinyUI(pageWithSidebar(
    
    headerPanel(" Required sample size for intraclass correlation with desired precision (confidence interval around ICC)"),
    
    sidebarPanel(
        
        numericInput('k', 'Number of raters (k)', 2, min = 2, max = 100, step = 1),
        
        numericInput('ICC', 'Specified intraclass correlation (ICC)', 0.80, min = 0, max = 1, step = 0.01),
        
        numericInput('width', 'Desired width of the 95% confidence interval (w)', 0.2, min = 0, max = 1, step = 0.01)
    ),
    
    mainPanel(

        verbatimTextOutput("obeta"),
        
        h4('Required sample size (n):'),
        
        verbatimTextOutput("estimation"),
        
        h6('Approximate number of subjects required to obtain an exact 95% confidence interval of 
           the desired width for an intraclass correlation coefficient (ICC) in one-way and two-way 
           ANOVA models. Alpha fixed at 0.05 and Beta (1 - Power) at 0.20.'),
        
        br(),
        
        h6('Can be used to estimate the required approximate sample size (n) for (inter-rater 
            or test-retest) reliability studies. For example: for a reliability study with two 
            raters (or two repeated measurements) and an expected ICC value of 0.8, 51 subjects 
            are needed to obtain a desired width of 0.2 for the 95% confidence interval 
            (i.e., the value of ICC is between 0.7 and 0.9).'),
        h6(em('Note: for k = 2 and ICCs >= 0.7, the approximate sample size tends to slightly 
              diverge from the correct sample size (nc). In these special cases the accuracy can be 
              considerably improved by adding (5 * ICC) to the approximate sample size. In the 
              example above: nc = 51 + (5 * 0.8) = 55.')),
        br(),
        
        h5('Reference:'),
        
        h6('Bonett DG. Sample size requirements for estimating intraclass correlations with desired precision. Stat Med. 2002;21(9):1331-5.')
        
        
    )
    
))