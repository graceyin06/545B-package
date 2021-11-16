test_that("Testing histogram_plot function", {
  require(datateachr)
  require(testthat)
  require(tidyverse)
  a<-histogram_plot(cancer_sample,diagnosis,radius_mean,"radius_mean")
  expect_equal(length(a), 2)
  expect_identical(a[[2]]$labels$x, "radius_mean")
  expect_null(a$scales$scales$range$range)
})
