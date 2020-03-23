library(nobel)

test_that("info",{
  expect_is(get_nobel_info(),"data.frame")
})