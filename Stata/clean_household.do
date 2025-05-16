* Swiss TPH - Research Data Management, 2025
* do file for cleaning the household-level data
* 2025-05-15 HL

* Set up your working directory
* YOU NEED TO MODIFY THIS PATH WHEN RUNNING THE CODE ON YOUR LOCAL ENVIRONMENT
* Load the dataset
use "C:\Users\kwizpa\Desktop\Semester 2\RDM\mscepi_rdm\Data\hh-data.dta",clear

* Display structure: variable names, types, and labels
describe

* Summarize variables (includes type, missing, basic stats)
summarize

* View variable labels (metadata)
codebook
browse

* Convert 'date_final' from string to date format (assuming format like "January 01, 2023")
* First, convert the string to a Stata date
gen date_clean = date(date_final, "MDY", 2025)  // Replace 2025 if year system matters
format date_clean %td  // Format as date

* Drop the original 'date_final' column
drop date_final

* Investigate problematic region codes
tab province regcode

* Recode incorrect region code: set regcode "20" to "2"
replace regcode = 2 if regcode == 20

* View updated summary
summarize

// Save the dataset
save "..\data\cleanStata_household_data.dta", replace