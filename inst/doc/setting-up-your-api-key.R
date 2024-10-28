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
#  # core functions that interact with TimeGPT
#  - nixtlar::nixtla_client_forecast()
#  - nixtlar::nixtla_client_historic()
#  - nixtlar::nixtla_client_detect_anomalies()
#  - nixtlar::nixtla_client_cross_validation()

## ----eval=FALSE---------------------------------------------------------------
#  nixtlar::nixtla_client_setup(api_key = "Your API key here")

## ----eval=FALSE---------------------------------------------------------------
#  options(NIXTLA_API_KEY="Your API key here")

## ----eval=FALSE---------------------------------------------------------------
#  getOption("NIXTLA_API_KEY")

## ----eval=FALSE---------------------------------------------------------------
#  library(usethis)
#  usethis::edit_r_environ()

## ----eval=FALSE---------------------------------------------------------------
#  # Inside the .Renviron file
#  NIXTLA_API_KEY="paste your API key here"

## ----eval=FALSE---------------------------------------------------------------
#  nixtlar::nixtla_validate_api_key()

## ----eval=FALSE---------------------------------------------------------------
#  nixtlar::nixtla_client_setup(
#    base_url = "Base URL here",
#    api_key = "Your API key here"
#  )

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

