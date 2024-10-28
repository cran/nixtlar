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
#  nixtla_client_setup(api_key = "Your API key here")

## ----eval=FALSE---------------------------------------------------------------
#  nixtla_client_setup(
#    base_url = "Base ULR",
#    api_key = "Your API key here"
#  )

## ----eval=FALSE, message=FALSE------------------------------------------------
#  library(usethis)
#  usethis::edit_r_environ()

## ----eval=FALSE---------------------------------------------------------------
#  # Inside the .Renviron file
#  NIXTLA_API_KEY="Your API key here"

## ----eval=FALSE---------------------------------------------------------------
#  # Inside the .Renviron file
#  NIXTLA_BASE_URL="Base URL"
#  NIXTLA_API_KEY="Your API key here"

## ----eval=FALSE---------------------------------------------------------------
#  nixtla_validate_api_key()

## -----------------------------------------------------------------------------
df <- nixtlar::electricity
head(df)

## -----------------------------------------------------------------------------
nixtla_client_fcst <- nixtla_client_forecast(df, h = 8, level = c(80,95))
head(nixtla_client_fcst)

## -----------------------------------------------------------------------------
nixtla_client_plot(df, nixtla_client_fcst, max_insample_length = 200)

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

