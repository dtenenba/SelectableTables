needHack <- FALSE

shinyServer(function(input, output) {
  
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

