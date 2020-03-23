library(nobel)

test_that("share",{
  expect_is(get_nobel_share(),"data.frame")
})