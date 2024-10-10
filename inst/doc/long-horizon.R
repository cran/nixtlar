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
test <- df |> 
  dplyr::group_by(unique_id) |> 
  dplyr::slice_tail(n = 96) |> 
  dplyr::ungroup() 

train <- df[df$ds %in% setdiff(df$ds, test$ds), ]

## -----------------------------------------------------------------------------
fcst_long_horizon <- nixtlar::nixtla_client_forecast(train, h=96, model="timegpt-1-long-horizon")
head(fcst_long_horizon)

## -----------------------------------------------------------------------------
nixtlar::nixtla_client_plot(train, fcst_long_horizon, max_insample_length = 200)

## -----------------------------------------------------------------------------
fcst <- nixtlar::nixtla_client_forecast(train, h=96)
head(fcst)

## -----------------------------------------------------------------------------
names(fcst_long_horizon)[which(names(fcst_long_horizon) == "TimeGPT")] <- "TimeGPT-long-horizon"

res <- merge(fcst, fcst_long_horizon) # merge TimeGPT and TimeGPT-long-horizon
res$ds <- as.character(res$ds)

res <- merge(test, res) # merge with actual values
head(res)

## -----------------------------------------------------------------------------
print(paste0("MAE TimeGPT: ", mean(abs(res$y-res$TimeGPT))))
print(paste0("MAE TimeGPT long-horizon: ", mean(abs(res$y-res$`TimeGPT-long-horizon`))))

