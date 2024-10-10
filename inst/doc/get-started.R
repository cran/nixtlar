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
#  nixtla_set_api_key(api_key = "paste your API key here")

## ----eval=FALSE, message=FALSE------------------------------------------------
#  library(usethis)
#  usethis::edit_r_environ()

## ----eval=FALSE---------------------------------------------------------------
#  # Inside the .Renviron file
#  NIXTLA_API_KEY="paste your API key here"

## ----eval=FALSE---------------------------------------------------------------
#  nixtla_validate_api_key()

## -----------------------------------------------------------------------------
df <- nixtlar::electricity
head(df)

## -----------------------------------------------------------------------------
nixtla_client_fcst <- nixtla_client_forecast(df, h = 8, level = c(80,95))
head(nixtla_client_fcst)

## -----------------------------------------------------------------------------
nixtla_client_plot(df, nixtla_client_fcst, id_col = "unique_id", max_insample_length = 200)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

