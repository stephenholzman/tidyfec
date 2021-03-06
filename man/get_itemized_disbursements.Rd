% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_schedule_b.R
\name{get_itemized_disbursements}
\alias{get_itemized_disbursements}
\alias{get_schedule_b}
\title{Get Itemized Campaign Disbursements}
\usage{
get_itemized_disbursements(data = NULL,
  api_key = Sys.getenv("DATAGOV_API_KEY"), data_structure = "tidy",
  recipient_state = NULL, sort_null_only = NULL,
  recipient_city = NULL, sort_hide_null = NULL, max_date = NULL,
  disbursement_purpose_category = NULL,
  last_disbursement_amount = NULL, recipient_name = NULL,
  sort = NULL, min_amount = NULL, min_date = NULL,
  last_disbursement_date = NULL, min_image_number = NULL,
  image_number = NULL, max_amount = NULL,
  recipient_committee_id = NULL, committee_id = NULL,
  max_image_number = NULL, disbursement_description = NULL,
  two_year_transaction_period = NULL, line_number = NULL)

get_schedule_b(data = NULL, api_key = Sys.getenv("DATAGOV_API_KEY"),
  data_structure = "tidy", recipient_state = NULL,
  sort_null_only = NULL, recipient_city = NULL,
  sort_hide_null = NULL, max_date = NULL,
  disbursement_purpose_category = NULL,
  last_disbursement_amount = NULL, recipient_name = NULL,
  sort = NULL, min_amount = NULL, min_date = NULL,
  last_disbursement_date = NULL, min_image_number = NULL,
  image_number = NULL, max_amount = NULL,
  recipient_committee_id = NULL, committee_id = NULL,
  max_image_number = NULL, disbursement_description = NULL,
  two_year_transaction_period = NULL, line_number = NULL)
}
\arguments{
\item{data}{A dataframe or tibble. Usually this will be the returned result of search_candidates(). If a column is called 'candidate_id', get_candidate_totals() will return results for all IDs in that column and will attempt to join data to the result by candidate_id. Either this argument or candidate_ids is required}

\item{api_key}{API key for https://api.data.gov. Get one at https://api.data.gov/signup.}

\item{data_structure}{A character describing how you want OpenFEC results. Options are 'tidy', 'list', or 'both.' Choose list for raw results.}

\item{recipient_state}{State of recipient}

\item{sort_null_only}{Toggle that filters out all rows having sort column that is non-null}

\item{recipient_city}{City of recipient}

\item{sort_hide_null}{Hide null values on sorted column(s).}

\item{max_date}{Maximum date}

\item{disbursement_purpose_category}{Disbursement purpose category}

\item{last_disbursement_amount}{When sorting by disbursement_amount, this is populated with the disbursement_amount of the last result. However, you will need to pass the index of that last result to last_index to get the next page.}

\item{recipient_name}{Name of recipient}

\item{sort}{Provide a field to sort by. Use - for descending order.}

\item{min_amount}{Filter for all amounts greater than a value.}

\item{min_date}{Minimum date}

\item{last_disbursement_date}{When sorting by disbursement_date, this is populated with the disbursement_date of the last result. However, you will need to pass the index of that last result to last_index to get the next page.}

\item{image_number}{The image number of the page where the schedule item is reported}

\item{max_amount}{Filter for all amounts less than a value.}

\item{recipient_committee_id}{The FEC identifier should be represented here if the contributor is registered with the FEC.}

\item{committee_id}{A unique identifier assigned to each committee or filer registered with the FEC. In general committee id's begin with the letter C which is followed by eight digits.}

\item{disbursement_description}{Description of disbursement}

\item{two_year_transaction_period}{This is a two-year period that is derived from the year a transaction took place in the Itemized Schedule A and Schedule B tables. In cases where we have the date of the transaction (contribution_receipt_date in schedules/schedule_a, disbursement_date in schedules/schedule_b) the two_year_transaction_period is named after the ending, even-numbered year. If we do not have the date of the transaction, we fall back to using the report year (report_year in both tables) instead, making the same cycle adjustment as necessary. If no transaction year is specified, the results default to the most current cycle.}

\item{line_number}{Filter for form and line number using the following format: FORM-LINENUMBER. For example an argument such as F3X-16 would filter down to all entries from form F3X line number 16.}
}
\description{
Get itemized disbursements (Schedule B reported on Forms F3, F3X and F3P). Returns information about spending. If you just need total disbursements, use get_candidate_totals().
}
\details{
OpenFEC Documentation: Schedule B filings describe itemized disbursements. This data explains how committees and other filers spend their money. These figures are reported as part of forms F3, F3X and F3P.

The data is divided in two-year periods, called two_year_transaction_period, which is derived from the disbursement_date. If no value is supplied, the results will default to the most recent two-year period that is named after the ending, even-numbered year.
}
