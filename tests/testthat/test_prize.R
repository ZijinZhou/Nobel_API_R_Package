library(nobel)

test_that("prize",{
  expect_is(get_prize(),"data.frame")
})
