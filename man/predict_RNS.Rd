% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_rns.R
\name{predict_RNS}
\alias{predict_RNS}
\title{Predict with and without river network smoothers}
\usage{
predict_RNS(
  gmod,
  newdata,
  RNS_col,
  by_factor_col,
  to_drop_col = NULL,
  single_RNS = FALSE,
  single_RNS_factor_col = NULL,
  single_RNS_factor = NULL,
  type = "link",
  se.fit = FALSE
)
}
\arguments{
\item{gmod}{Model that you are predicting with}

\item{newdata}{Prediction dataset (data points you are predicting for)}

\item{RNS_col}{column for the river network smoother 'riversmooth' in our case}

\item{by_factor_col}{column/factors that the river network smoother is different for
(e.g. by= in model call) in our case this may be CTMName or Lifestage}

\item{to_drop_col}{the default is NULL - here any column names you wish to drop can be
provide e.g. if you wanted to predict without a hydrometric area smoother NOTE: Random effects columns are automatically removed from the lpmatrix
within the function and no longer need to be provided.Similarly for catchments
without an RNS you do not need to provide the RNS columns. If you want to predict
without RNS, say for partial effects plots, just add in the RNS column
(in our case 'riversmooth) and function will generate the appropriate names to drop
from lpmatrix}

\item{single_RNS}{the default is FALSE - RNS will have multiple levels. If the RNS has only one level
e.g. a single catchment or lifestage this should be changed to true}

\item{single_RNS_factor_col}{the default is NULL - if the RNS has only one level (e.g. a single
catchment or lifestage) the column where this level could be found in a prediction
data should be included here ('CTMName' or 'Lifestage' in our case)}

\item{single_RNS_factor}{the default is NULL - if the RNS has only one level (e.g. a single}

\item{type}{the default is "link" (predictions) but can use lpmatrix}

\item{se.fit}{the default is FALSE (no standard errors)
NOTE: if se.fit=T the result returned is a list but using $fit or $se.fit after
the model call lets you add each in a column}
}
\value{
If type=="lpmatrix" then a matrix is returned which will give a vector of linear
predictor values (minus any offest) at the supplied covariate values, when
applied to the model coefficient vector. Otherwise, if se.fit is TRUE then a 2
item list is returned with items (both arrays) fit and se.fit containing predictions
and associated standard error estimates, otherwise an array of predictions is returned.
}
\description{
Function to allow you to predict with and without river network smoothers in
gam/bam models
}
\details{
This function allows you to predict for data in the following formats, using gam or bam models:
 With river networks smoothers where all prediction data points have an RNS
 e.g. predicting for observed catchments or lifestages
 Without river networks smoothers where no prediction data points have an RNS
 e.g. predicting to observed catchments or lifestages
With river networks smoothers AND without river network smoothers in the
prediction dataset
e.g. predicting to both observed AND unobserved catchments or lifestages

The function has been optimised so there is no longer a requirement to subset data,
predictions for all data can be done in one step. Furthermore, there is no need
to provide a vector of RNS names or random effects names within the function call
these are now taken from the model object and the column used to generate RNS or RE

The function can also deal with circumstances where the RNS may not have multiple levels
e.g. a model for a single catchment or lifestage. Predictions can be made with and
without RNS as above
}
