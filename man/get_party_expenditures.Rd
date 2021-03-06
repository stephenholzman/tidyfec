% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_schedule_f.R
\name{get_party_expenditures}
\alias{get_party_expenditures}
\alias{get_schedule_f}
\title{Get Party Expenditures for Federal Candidates}
\usage{
get_party_expenditures(data = NULL,
  api_key = Sys.getenv("DATAGOV_API_KEY"), data_structure = "tidy",
  payee_name = NULL, cycle = NULL, sort_null_only = NULL,
  sort_hide_null = NULL, max_date = NULL, candidate_id = NULL,
  sort = NULL, min_amount = NULL, min_date = NULL,
  min_image_number = NULL, image_number = NULL, max_amount = NULL,
  committee_id = NULL, max_image_number = NULL, line_number = NULL)

get_schedule_f(data = NULL, api_key = Sys.getenv("DATAGOV_API_KEY"),
  data_structure = "tidy", payee_name = NULL, cycle = NULL,
  sort_null_only = NULL, sort_hide_null = NULL, max_date = NULL,
  candidate_id = NULL, sort = NULL, min_amount = NULL,
  min_date = NULL, min_image_number = NULL, image_number = NULL,
  max_amount = NULL, committee_id = NULL, max_image_number = NULL,
  line_number = NULL)
}
\arguments{
\item{data}{A dataframe or tibble. Usually this will be the returned result of search_candidates(). If a column is called 'candidate_id', get_candidate_totals() will return results for all IDs in that column and will attempt to join data to the result by candidate_id. Either this argument or candidate_ids is required}

\item{api_key}{API key for https://api.data.gov. Get one at https://api.data.gov/signup.}

\item{data_structure}{A character describing how you want OpenFEC results. Options are 'tidy', 'list', or 'both.' Choose list for raw results.}

\item{cycle}{Filter records to only those that were applicable to a given two-year period.The cycle begins with an odd year and is named for its ending, even year}

\item{sort_null_only}{Toggle that filters out all rows having sort column that is non-null}

\item{sort_hide_null}{Hide null values on sorted column(s).}

\item{max_date}{Maximum date}

\item{candidate_id}{A unique identifier assigned to each candidate registered with the FEC. If a person runs for several offices, that person will have separate candidate IDs for each office.}

\item{sort}{Provide a field to sort by. Use - for descending order.}

\item{min_amount}{Filter for all amounts greater than a value.}

\item{min_date}{Minimum date}

\item{image_number}{The image number of the page where the schedule item is reported}

\item{max_amount}{Filter for all amounts less than a value.}

\item{committee_id}{A unique identifier assigned to each committee or filer registered with the FEC. In general committee id's begin with the letter C which is followed by eight digits.}

\item{line_number}{Filter for form and line number using the following format: FORM-LINENUMBER. For example an argument such as F3X-16 would filter down to all entries from form F3X line number 16.}
}
\description{
Schedule F shows all special expenditures a national or state party committee makes in connection with the general election campaigns of federal candidates
}
\details{
These coordinated party expenditures do not count against the contribution limits but are subject to other limits, these limits are detailed in Chapter 7 of the FEC Campaign Guide for Political Party Committees.
}
\examples{

}
