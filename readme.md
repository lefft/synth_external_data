
target states are: 

	> AZ -- arizona
	> KY -- kentucky 
	> MA -- massachussets (sp?)
	> MN -- minnesota
	> NC -- north carolina
	> ND -- north dakota
	> WA -- washington (state)
	> WI -- wisconsin
	> WV -- west virginia


each dataset should be processed in the same way, as described in steps (i)-(iv) (see also `code/main.r` for an example)


##### step (i): read in dataset



##### step (ii): inspect dataset, filling in...

  - a line of `catalog_of_datasets.csv` (note use of pipe `|` as keyword separator)
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

