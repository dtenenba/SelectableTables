

if (!exists("needHack")) needHack <- FALSE
  

if (needHack)
{
    # FIXME, this should be system.file (not file.path) if used in a package
    addResourcePath("js", file.path("www", "js"))
}

selDataTableOutput <- function (outputId) 
{
  tagList(singleton(tags$head(tags$link(rel = "stylesheet", 
    type = "text/css", href = "shared/datatables/css/DT_bootstrap.css"),
    tags$style(type="text/css", ".rowsSelected td{
               background-color: rgba(112,164,255,0.2) !important}"),
    tags$style(type="text/css", ".selectable div table tbody tr{
               cursor: hand; cursor: pointer;}"),
    tags$style(type="text/css",".selectable div table tbody tr td{
               -webkit-touch-callout: none;
               -webkit-user-select: none;
               -khtml-user-select: none;
               -moz-user-select: none;
               -ms-user-select: none;
               user-select: none;}"),                          
    tags$script(src = "shared/datatables/js/jquery.dataTables.min.js"), 
    tags$script(src = "shared/datatables/js/DT_bootstrap.js"),
    tags$script(src = "js/DTbinding.js"))),
    div(id = outputId, class = "shiny-datatable-output selectable"))
}
