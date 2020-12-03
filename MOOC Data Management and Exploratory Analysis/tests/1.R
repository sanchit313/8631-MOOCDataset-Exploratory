#  Unit Testing Script
context("Basic checks")

# Test data

#test video stats file from  analysis b.r
test_that("Correct columns in 1 of the video stats file", {
  expect_equal(ncol(Extracted.video3), 6)
})

