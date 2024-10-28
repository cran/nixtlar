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
df <- nixtlar::electricity # load data 

# create some missing values at random 
index <- sample(nrow(df), 10)
df$y[index] <- NA

# check for missing values 
any(is.na(df)) # will return TRUE if there are missing values 

## -----------------------------------------------------------------------------

df <- nixtlar::electricity

# infer the frequency when `freq` is not specified 
fcst <- nixtlar::nixtla_client_forecast(df, h = 8, level = c(80,95)) # freq = "h"

## ----include=FALSE------------------------------------------------------------
options(original_options)
end_vignette()

