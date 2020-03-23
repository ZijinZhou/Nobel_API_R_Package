library(nobel)

test_that("gender",{
  expect_is(get_nobel_gender(),"data.frame")
})