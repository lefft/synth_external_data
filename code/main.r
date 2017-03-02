# attach packages to be used in cleaning process
library("plyr"); library("dplyr"); library("reshape2")

# load utility functions etc.
source("functions.r")

# location of raw datasets
raw_dir <- "../data_raw/"

# inventory of datasets, as a vector of filenames w id's prepended
# **make completely sure that all datasets have correct id in filename**
datasets <- dir(raw_dir)[endsWith(dir(raw_dir), ".csv")]


### dataset_1 #################################################################
# === === === === === === === === === === === === === === === === === === 


### step (i): read in dataset
# === === === === === ===  
dat1 <- read.csv(paste0(raw_dir, datasets[1]), stringsAsFactors=FALSE)

### step (ii): inspect dataset and record basic info
# === === === === === === 

# [completed as much of catalog line as possible]

### step (iii): brief tim on nature of data
# === === === === === === 

# [data is about post-secondary institutions ~~~> not usable]

### step (iv): process dataset
# === === === === === === 

# [filed away stuff where it's supposed to go and finished cataloging]


### dataset_2 #################################################################
# === === === === === === === === === === === === === === === === === === 



### dataset_3 #################################################################
# === === === === === === === === === === === === === === === === === === 



### dataset_4 #################################################################
# === === === === === === === === === === === === === === === === === === 




### dataset_1 #################################################################
# === === === === === === === === === === === === === === === === === === 



### ... #######################################################################
# === === === === === === === === === === === === === === === === === === 



### dataset_n #################################################################
# === === === === === === === === === === === === === === === === === === 




### steps #####################################################################
# === === === === === === === === === === === === === === === === === === 

### step (i): read in dataset
# === === === === === ===  

### step (ii): inspect dataset and fill in 
# === === === === === === 
#   - a line of `catalog_of_datasets.csv`
#   - a line of `data_sources.xlsx` *if first time source used*

### step (iii): brief tim on nature of data
# === === === === === === 
#   - talk to tim, we will decide if data is usable

### step (iv): process dataset
# === === === === === === 
#   - if dataset usable:
#       ~~~> clean up as necessary
#       ~~~> complete line of catalog file
#       ~~~> file clean dataset and associated files in `output`
# 
#   - if dataset not usable:
#       ~~~> complete line of catalog file
#       ~~~> in `output`, add `_not_usable` to associated folder name
# 
#   - in either case, *briefly* say what happened in `dataset_*_notes.txt`
#   - file `dataset_*_notes.txt` away in appropriate folder


### end of script
