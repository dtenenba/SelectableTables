
needHack <- TRUE # change to false if problem referenced here is solved:
# https://groups.google.com/forum/#!topic/shiny-discuss/Lhdi7A_csR4

# Note that if needHack is true, you'll have to (I think) restart the shiny app
# in order for changes to the js file to take effect. 


# if using the methodized version, 
# start by sourcing this file.
# to use the old-school version, type
# runApp()

library(shiny)

source("global.R")

runApp(list(ui=
pageWithSidebar(
  
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

),

server=
function(input, output) {
  
  output$myTable <- renderDataTable({mtcars}, options = list(bSortClasses = TRUE))
  
  # observe({
  #   print("Click Event")
  #   print(input$myTable)
  #   })

 observe({
    if (input$btnSend > 0)
      print(isolate(input$myTable))
    })
})




)
