#' Housing Loan info
#'
#' This package contains information about Massachusetts housing loans in 2017.
#' @docType package
#' @name HousingLoans
#' @aliases HousingLoans HousingLoans-package
NULL

#' "Housing Loans"
#'
#' A data set containing housing loan application data for Massachusetts in 2017.
#'
#' @source \url{https://www.consumerfinance.gov/data-research/hmda/historic-data/}
#' @format A dataframe with 268648 elements
#' \describe{
#'   \item{Agency}{Name of agency that originated the loan}
#'   \item{County}{County in which property is located}
#'   \item{Loan_Accepted}{Whether the application resulted in an originated loan or not}
#'   \item{Loan_Amount_In_Thousands}{Loan amount in thousands of dollars}
#'   \item{Loan_Purpose}{Stated purpose of the loan}
#'   \item{Loan_Type}{Type of loan sought}
#'   \item{Owner_Occupancy}{Whether the owner intends to occupy the property}
#'   \item{Preapproval}{Whether preapproval was requested}
#'   \item{Property_Type}{Type of property to be purchased with loan}
#' }
"HousingLoans"
