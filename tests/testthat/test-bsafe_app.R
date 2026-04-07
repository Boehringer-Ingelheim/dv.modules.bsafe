# app tests ----
local({
  test_that("bsafe module starts", {
    app <- shinytest2::AppDriver$new(dv.modules.bsafe:::mock_bsafe())
    app$wait_for_idle()
    checkmate::expect_string(app$get_html("body"), min.chars = 1)
  })
})

# app tests ----
local({
  test_that("tm_bsafe starts", {
    app <- suppressWarnings(shinytest2::AppDriver$new(dv.modules.bsafe:::mock_bsafe()))
    app$wait_for_idle()
    checkmate::expect_string(app$get_html("body"), min.chars = 1)
  })
})
