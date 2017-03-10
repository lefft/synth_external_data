
target states are: 

	> AZ -- arizona
  - http://www.azed.gov/research-evaluation/aims-improvement/
  - http://www.azed.gov/research-evaluation/data/
  - http://www.azed.gov/assessment/
	- http://www.azed.gov/research-evaluation/report-cards/
  - http://www.azed.gov/research-evaluation/school-report-cards/
  - http://www.azed.gov/research-evaluation/data/
  - http://www.azed.gov/accountability/reportsfederal-accountability/
  - http://www.azed.gov/research-evaluation/school-report-cards/
  - 
  > KY -- kentucky 
	> MA -- massachussets (sp?)
	> MN -- minnesota
	> NC -- north carolina
	> ND -- north dakota
	> WA -- washington (state)
	> WI -- wisconsin
	> WV -- west virginia


each dataset should be processed in the same way, as described in steps (i)-(iv) (see also `code/main.r` for an example)


##### step (i): read in dataset [download copy of dataset named following convention in data_raw, and read it (open it)]


##### step (ii): inspect dataset, filling in...

  - a line of `catalog_of_datasets.csv` (note use of pipe `|` as keyword separator) [to the right of id_format_smallest_unit, create new column id_format_examples (inc. <=3 examples separated by " | ")]
  - a line of `data_sources.xlsx` (*iff first time source is used*)


##### step (iii): brief tim on nature of dataset

  - talk to tim, we will decide if data is usable 


##### step (iv): process dataset

  - if dataset determined to be usable:

      - clean up as necessary
  
      - complete line of catalog file
  
      - file away clean dataset and associated files in `output`

  - if dataset determined to be not usable:
  
      - complete line of catalog file
  
      - in `output`, add `_not_usable` to associated folder name

  - in either case, *briefly* record what happened in `dataset_*_notes.txt`
  
  - file `dataset_*_notes.txt` away in appropriate folder

