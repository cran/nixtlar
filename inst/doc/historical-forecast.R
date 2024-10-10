## ----setup, include=FALSE-----------------------------------------------------
library(httptest2)
.mockPaths("../tests/mocks")
start_vignette(dir = "../tests/mocks")

original_options <- options("NIXTLA_API_KEY"="dummy_api_key", digits=7)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width = 7, 
  fig.height = 4
)

## -----------------------------------------------------------------------------
library(nixtlar)

## -----------------------------------------------------------------------------
df <- nixtlar::electricity
head(df)

## -----------------------------------------------------------------------------
nixtla_client_fitted_values <- nixtla_client_historic(df, level = c(80,95))
head(nixtla_client_fitted_values)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

