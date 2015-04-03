needHack <- FALSE

library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("Data Tables binding"),
  sidebarPanel(
    p("Shift-Click to select multiple rows."),
    actionButton("btnSend", "Send Rows"),
    tags$button("Select All Rows", class="btn", id="select_all_rows"),
    tags$button("Deselect All Rows", class="btn", id="deselect_all_rows")
  ),
  
  mainPanel(
    selDataTableOutput("myTable")
  ) 
)
)
