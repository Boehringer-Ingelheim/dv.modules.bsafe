# nocov start

#' @title mock_poc_bsafe_app
#'
#' @description dummy mock app function
#'
#' @export
mock_bsafe <- function() {
  ui <- function(request) {
    shiny::fluidPage(
      bsafe_UI(
        id = "bsafe"
      ),
      shiny::verbatimTextOutput("out")
    )
  }

  server <- function(input, output, session) {
    x <- bsafe_server(
      id = "bsafe",
      dataset = shiny::reactive(dv.modules.bsafe::bsafe_data)
    )

    output[["out"]] <- shiny::renderPrint({
      x()$code
    })
  }

  shiny::shinyApp(
    ui = ui,
    server = server
  )
}

# nocov end

mock_bsafe_app_mm <- function() {
  
  requireNamespace("dv.manager")

  dv.manager::run_app(
    data = list(bsafe = list(bsafe = dv.modules.bsafe::bsafe_data)),
    module_list = list(
      bsafe = mod_bsafe("bsafe", "bsafe")
    ),
    filter_data = "bsafe",
    filter_key = "STUDYID"
  )
}
