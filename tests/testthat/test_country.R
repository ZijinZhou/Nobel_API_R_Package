library(nobel)

test_that("country",{
  expect_is(get_nobel_country(),"data.frame")
})