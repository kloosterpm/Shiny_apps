# This is the front end file.


shinyUI(pageWithSidebar(
    
    headerPanel("Required sample size for intraclass correlation with desired power (hypothesis testing)"),
    
    sidebarPanel(
        
        numericInput('icc1', 'Expected value of ICC', 0.80, min = 0, max = 1, step = 0.01),
        
        numericInput('icc0', 'Minimum acceptable ICC', 0.60, min = 0, max = 1, step = 0.01),
        
        numericInput('k', 'Number of raters (k)', 2, min = 0, max = 999, step = 1),
        
        numericInput('power', 'Desired power (1 - beta)', 0.80, min = 0, max = 1, step = 0.01),
        
        numericInput('alpha', 'Significance level (alpha, two-sided)', 0.05, min = 0, max = 1, step = 0.01)
        
        
    ),
    
    mainPanel(
        
        verbatimTextOutput("obeta"),
        
        h4('Required sample size (n):'),
        
        verbatimTextOutput("estimation"),
        
        h6('Approximate number of subjects required to test an intraclass correlation coefficient 
            (ICC) in a one-way ANOVA model with desired power.'),
        h6(em('Note: For a one-tailed hypothesis test, multiply the desired significance 
              level by two (e.g., 0.05 * 2 = 0.1)!')),
        br(),
        
        h6('Can be used to estimate the required approximate sample size (n) for (inter-rater or 
            test-retest) reliability studies. For example: for a reliability study 
            with two raters (or two repeated measurements), an expected ICC value of 0.8 and a 
            desired power of 0.8 (80%), 49 subjects are needed to demonstrate that this ICC value 
            is significantly different from a minimum acceptable ICC value of 0.60 at a significance 
            level of 0.05 (two-tailed significance, for a one-tailed test the required sample size 
            is 39 subjects).'),
        
        br(),
        
        h5('References:'),
        
        h6('Walter SD, Eliasziw M, Donner A. Sample size and optimal designs for reliability studies. Stat Med. 1998;17(1):101-10.')

        
    )
    
))