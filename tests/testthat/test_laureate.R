library(nobel)

test_that("laureate",{
  expect_is(get_laureate(),"data.frame")
})