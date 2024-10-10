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

## ----eval=FALSE---------------------------------------------------------------
#  # Core functions of `nixtlar`
#  - nixtlar::nixtla_client_forecast()
#  - nixtlar::nixtla_client_historic()
#  - nixtlar::nixtla_client_detect_anomalies()
#  - nixtlar::nixtla_client_cross_validation()
#  - nixtlar::nixtla_client_plot()

## -----------------------------------------------------------------------------
# sample valid input 
df <- nixtlar::electricity
head(df)
str(df)

## -----------------------------------------------------------------------------
# sample valid input with exogenous variables 
df <- nixtlar::electricity_exo_vars
head(df)

future_exo_vars <- nixtlar::electricity_future_exo_vars
head(future_exo_vars)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

