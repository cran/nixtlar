## ----setup, include=FALSE-----------------------------------------------------
library(httptest2)
.mockPaths("../tests/mocks")
start_vignette(dir = "../tests/mocks")

original_options <- options("NIXTLA_API_KEY"="dummy_api_key", digits=7)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width = 12, 
  fig.height = 8
)

## -----------------------------------------------------------------------------
library(nixtlar)

## -----------------------------------------------------------------------------
df <- nixtlar::electricity
head(df)

## ----eval=FALSE---------------------------------------------------------------
#  - nixtlar::nixtla_client_forecast()
#  - nixtlar::nixtla_client_historic()
#  - nixtlar::nixtla_client_cross_validation()

## -----------------------------------------------------------------------------
fcst <- nixtla_client_forecast(df, h = 8, quantiles = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9))
head(fcst)

## -----------------------------------------------------------------------------
nixtla_client_plot(df, fcst, max_insample_length = 100)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

