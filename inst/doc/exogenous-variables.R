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
df_exo_vars <- nixtlar::electricity_exo_vars
head(df_exo_vars)

## -----------------------------------------------------------------------------
future_exo_vars <- nixtlar::electricity_future_exo_vars
head(future_exo_vars)

## -----------------------------------------------------------------------------
fcst_exo_vars <- nixtla_client_forecast(df_exo_vars, h = 24, X_df = future_exo_vars)
head(fcst_exo_vars)

## -----------------------------------------------------------------------------
df <- nixtlar::electricity # same dataset but without the exogenous variables

fcst <- nixtla_client_forecast(df, h = 24)
head(fcst)

## -----------------------------------------------------------------------------
nixtla_client_plot(df_exo_vars, fcst_exo_vars, max_insample_length = 500)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

