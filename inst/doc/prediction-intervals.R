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
#  - nixtlar::nixtla_client_detect_anomalies()
#  - nixtlar::nixtla_client_cross_validation()

## -----------------------------------------------------------------------------
fcst <- nixtla_client_forecast(df, h = 8, level=c(80,95))
head(fcst)

## -----------------------------------------------------------------------------
anomalies <- nixtla_client_detect_anomalies(df) # level=c(90,95,99)
head(anomalies) # only the 99% confidence level is used 

## -----------------------------------------------------------------------------
nixtla_client_plot(df, fcst, max_insample_length = 100)

## -----------------------------------------------------------------------------
nixtlar::nixtla_client_plot(df, anomalies, plot_anomalies = TRUE)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

