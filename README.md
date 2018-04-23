
tidyfec
-------

The tidyfec package aims to make campaign finance data more accessible in R and friendly with tidy workflows. It works by accessing data through the [OpenFEC API](https://api.open.fec.gov/developers/), which requires an [API key](https://api.data.gov/signup/) to run.

Installation
------------

Though I'm developing out in the open, this is very much pre-alpha release status. Installation is through the devtools package

``` r
install.packages("devtools")
devtools::install_github("stephenholzman/tidyfec")
```

Examples
--------

Search for a candidates by name.

``` r
library(tidyfec)
library(tidyverse, warn.conflicts = FALSE)
#> ── Attaching packages ───────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
#> ✔ tibble  1.4.2     ✔ dplyr   0.7.4
#> ✔ tidyr   0.8.0     ✔ stringr 1.3.0
#> ✔ readr   1.1.1     ✔ forcats 0.3.0
#> Warning: package 'tibble' was built under R version 3.4.3
#> Warning: package 'tidyr' was built under R version 3.4.3
#> Warning: package 'stringr' was built under R version 3.4.3
#> Warning: package 'forcats' was built under R version 3.4.3
#> ── Conflicts ──────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
source("data.gov.key")
search_on_name <- tidyfec::search_candidates(api_key = api_key, name = "Obama", data_structure = "tidy")

head(search_on_name)
#> # A tibble: 6 x 25
#>   load_date last_file_date candidate_id party candidate_status office_full
#>   <chr>     <chr>          <chr>        <chr> <chr>            <chr>      
#> 1 2016-11-… 2016-01-11     S6CA00808    DEM   N                Senate     
#> 2 2016-11-… 2016-01-08     P60019015    DEM   N                President  
#> 3 2009-02-… 2009-01-29     S4IL00180    DEM   C                Senate     
#> 4 2009-02-… 2009-01-29     S4IL00180    DEM   C                Senate     
#> 5 2002-04-… 1999-08-04     H0IL01087    DEM   P                House      
#> # ... with 1 more row, and 19 more variables: state <chr>,
#> #   federal_funds_flag <lgl>, has_raised_funds <lgl>, office <chr>,
#> #   name <chr>, district_number <int>, incumbent_challenge <chr>,
#> #   party_full <chr>, first_file_date <chr>, active_through <int>,
#> #   incumbent_challenge_full <chr>, last_f2_date <chr>, district <chr>,
#> #   election_years <list>, cycles <list>, election_districts <list>,
#> #   principal_committees <list>, committee_id <chr>, committee_name <chr>
```

Search for a specific election.

``` r
search_on_election <- tidyfec::search_candidates(api_key = api_key, state = "VA", district = "05", office = "H", election_year = "2018", data_structure = "tidy")

head(search_on_election)
#> # A tibble: 6 x 26
#>   .        load_date      last_file_date candidate_id election_years party
#>   <list>   <chr>          <chr>          <chr>        <list>         <chr>
#> 1 <list [… 2017-10-16T21… 2017-07-24     H8VA05155    <list [1]>     DEM  
#> 2 <list [… 2017-10-24T21… 2017-07-02     H8VA05148    <list [1]>     DEM  
#> 3 <list [… 2017-05-23T07… 2017-05-16     H6VA05142    <list [2]>     REP  
#> 4 <list [… 2018-01-30T21… 2018-01-29     H8VA05163    <list [1]>     DEM  
#> 5 <list [… 2017-10-01T20… 2017-10-01     H8VA05114    <list [1]>     DEM  
#> # ... with 1 more row, and 20 more variables: candidate_status <chr>,
#> #   office_full <chr>, state <chr>, federal_funds_flag <lgl>,
#> #   has_raised_funds <lgl>, office <chr>, election_districts <list>,
#> #   name <chr>, district_number <int>, cycles <list>,
#> #   incumbent_challenge <chr>, party_full <chr>, first_file_date <chr>,
#> #   active_through <int>, incumbent_challenge_full <chr>,
#> #   last_f2_date <chr>, district <chr>, principal_committees <list>,
#> #   committee_id <chr>, committee_name <chr>
```

Search for candidate totals.

``` r
candidate_totals <- get_candidate_totals(api_key = api_key, candidate_ids = search_on_election$candidate_id, data_structure = "tidy")

head(candidate_totals)
#> # A tibble: 6 x 46
#>   .      loan_repayments candidate_id last_net_operati… transfers_from_ot…
#>   <list>           <dbl> <chr>                    <dbl>              <dbl>
#> 1 <list…              0. H8VA05155              274198.                 0.
#> 2 <list…              0. H8VA05148               28288.                 0.
#> 3 <list…              0. H6VA05142               11516.                 0.
#> 4 <list…          20000. H6VA05142               34038.             12889.
#> 5 <list…              0. H8VA05114              295051.            146608.
#> # ... with 1 more row, and 41 more variables: receipts <dbl>,
#> #   offsets_to_fundraising_expenditures <dbl>, other_receipts <dbl>,
#> #   candidate_contribution <dbl>,
#> #   individual_unitemized_contributions <dbl>,
#> #   operating_expenditures <dbl>, individual_contributions <dbl>,
#> #   fundraising_disbursements <dbl>,
#> #   political_party_committee_contributions <dbl>,
#> #   coverage_start_date <chr>, exempt_legal_accounting_disbursement <dbl>,
#> #   full_election <lgl>, loan_repayments_candidate_loans <dbl>,
#> #   offsets_to_legal_accounting <dbl>, last_debts_owed_to_committee <dbl>,
#> #   transfers_to_other_authorized_committee <dbl>,
#> #   refunded_other_political_committee_contributions <dbl>,
#> #   last_debts_owed_by_committee <dbl>, net_contributions <dbl>,
#> #   refunded_political_party_committee_contributions <dbl>,
#> #   federal_funds <dbl>, other_disbursements <dbl>,
#> #   coverage_end_date <chr>, last_net_contributions <dbl>,
#> #   offsets_to_operating_expenditures <dbl>, last_report_year <int>,
#> #   other_political_committee_contributions <dbl>,
#> #   individual_itemized_contributions <dbl>, loans <dbl>, cycle <int>,
#> #   last_report_type_full <chr>, last_cash_on_hand_end_period <dbl>,
#> #   loan_repayments_other_loans <dbl>, loans_made_by_candidate <dbl>,
#> #   net_operating_expenditures <dbl>, contributions <dbl>,
#> #   contribution_refunds <dbl>,
#> #   total_offsets_to_operating_expenditures <dbl>, disbursements <dbl>,
#> #   last_beginning_image_number <chr>, all_other_loans <dbl>
```

Visualize

``` r
library(ggplot2)
candidate_totals %>%
  filter(cycle == "2018") %>%
  left_join(search_on_election, by = c("candidate_id" = "candidate_id")) %>%
  gather(key = "type", value = "amount", receipts, disbursements, last_cash_on_hand_end_period) %>%
  ggplot() +
  geom_bar(aes(x = name, y = amount), stat = "identity") +
  facet_wrap(~type) +
  scale_y_continuous(labels = scales::dollar) +
  coord_flip()
```

![](README-unnamed-chunk-6-1.png)
