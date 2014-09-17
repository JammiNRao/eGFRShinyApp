library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("eGFR Estimator App"),
        sidebarPanel(
                numericInput("age", label = h4("Enter your age in years"), value=NULL),
                numericInput("cr", label = h4("Enter plasma creatinine in micromol/litre"), value=NULL),
                radioButtons("sex", label = h4("Gender"),
                             choices = list("Male"= 1, "Female" = 0.742)),
                radioButtons("black", label= h4("Ethnic group"),
                             choices = list("Black"=1.210, "Other"=1)),
                submitButton(text="Check and submit")
                
                ),
        mainPanel(
                textOutput("text1"),
                textOutput("text2"),
                
                h3("Your estimated GFR is: "),
                h3(textOutput("predegfr")),
                p('eGFR stands for estimated Glomerular Filtration Rate. It is a measure of renal function. This formula is based on an algorithm developed the MDRD (Modified Diet in Renal Disease) study.'),
                p('eGFR is expressed as ml/min/1.73SqM. 1.73 SqM is the average body surface area (BSA) for an adult male. So a value of 100 means that every minute, 100 ml of blood plasma per 1.73 BSA is filtered by the kidneys '),
                p('Roughly speaking, an eGFR value of 60 or more is normal, 30-59 indicates moderately reduced kidney function, and under 30 indicates severe renal insufficiency.'),
                p('Note that in this app the plasma creatinine level has to be in SI units - micromoles per litre, not as American Hospitals report it, in mg/100 ml. The algorithm cannot be applied to people under 18 years of age, and those with established renal disease. For more details see:'),
                a("http://www.renal.org")                
                )
        )
)
