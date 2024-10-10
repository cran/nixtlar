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
nixtla_client_anomalies <- nixtlar::nixtla_client_detect_anomalies(df) 
head(nixtla_client_anomalies)

## -----------------------------------------------------------------------------
nixtlar::nixtla_client_plot(df, nixtla_client_anomalies, plot_anomalies = TRUE)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

