library(nobel)

test_that("age",{
  expect_is(get_nobel_age(),"data.frame")
})
