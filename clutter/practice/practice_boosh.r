### we are going to address the issues identified by ryan
### in the document 'Cleaning - 9-12 Dropout Rate_2016_Feb_2_2017.txt'
# === === === 

### 1. read in the data we're going to manipulate, and make a copy ############
# === === === === === === === === === === === === === === === === === === 

# see where you are
getwd()

# see what's in where you are ("../" jumps up a level)
dir("../data/")

# read in the data
dat <- read.csv("../data/9-12 Dropout Rate_2016_Feb_2_2017.csv", 
                stringsAsFactors=FALSE)

# make a copy of the original, unchanged dataset (for comparison)
dat_raw <- dat

# look at the structure of dat and dat_raw (right now they're identical)
str(dat)
str(dat_raw)


### 2. go through the points ryan identified ##################################
# === === === === === === === === === === === === === === === === === === 



# 1. DETAIL_LVL_DESC values include "School","District","State": 
# including these as logical values in separate columns could be good.

# we want to create new columns for each unique value of DETAIL_LVL_DESC.
# for each value, the new column will be TRUE if the original had that value 
#
# first let's see what the unique values are
unique(dat$DETAIL_LVL_DESC)
#
# we can also see the distribution as a table
table(dat$DETAIL_LVL_DESC, useNA="ifany")
#

# okay, let's make the three new columns
# 
# there are many ways to do it, here is one
dat$DETAIL_LVL_DESC_District <- 
  ifelse(dat$DETAIL_LVL_DESC=="District", TRUE, FALSE)

dat$DETAIL_LVL_DESC_School <- 
  ifelse(dat$DETAIL_LVL_DESC=="School", TRUE, FALSE)

dat$DETAIL_LVL_DESC_State <- 
  ifelse(dat$DETAIL_LVL_DESC=="State", TRUE, FALSE)

table(dat$DETAIL_LVL_DESC_District, useNA="ifany")




# 2. SCHOOL_DSTRCT_NM values include "X" and terms 
# like "County","City", and some others 
# that are more rare, but it might be nice to draw these off in some way.

table(dat$SCHOOL_DSTRCT_NM, useNA="ifany")

# we want to remove the substrings 'County' and 'City' from the column
#
# let's remove them globally using the function gsub()
# 
# here's gsub() in action
dat$SCHOOL_DSTRCT_NM <-
  gsub(pattern=" County", replacement="", x=dat$SCHOOL_DSTRCT_NM)

dat$SCHOOL_DSTRCT_NM <-
  gsub(pattern=" City", replacement="", x=dat$SCHOOL_DSTRCT_NM)





# 3. colE vals include numerical values and the character value "All".

# we want INSTN_NUMBER to actually be a number vector, not a character vector
#
# to do this, first we'll change all the non-numbers to NA
#
dat$INSTN_NUMBER <- 
  ifelse(dat$INSTN_NUMBER=="ALL", NA, dat$INSTN_NUMBER)
# now that "ALL" is NA, we can just convert the column to numeric
dat$INSTN_NUMBER <- as.numeric(dat$INSTN_NUMBER)



# 4. Similarly (!), colF includes not just school names (that end, e.g., in 
# "High School", which could be pulled out) but also "All Column Values" where 
# colE val is "All". AND (looking at colG) these rows are the ones in which 
# colG indicates grades PK-12, so there's probably redundancy here that can be 
# eliminated.



# 5. Also in colF, "High" can be used instead of "High School" (as in 
# "High South" of row 21). Other vals include "Detention Center" as in row 43, 
# "Care Center" as in row 81, "Special Education Center" as in row 114, 
# "Academy School" and "Center" as in rows 121-122.





# 6. colG lists each grade in a school, such that both "09,10,11,12" and 
# "07,08,09" would be necessary values to reference in looking at schools 
# with grade 09. If we are interested only in particular grades, we can pull 
# out of this something like a logical value for whether or not the school is 
# a high school. If we want to be able to consider distinct grades, it may be 
# just as well to set up distinct logical value strings for each grade of 
# interest.


# let's classify a row as a "high school" if it has 9-12 grade
table(dat$GRADES_SERVED_DESC, useNA="ifany")

dat$has_high_school <- 
  grepl(pattern="09,10,11,12", x=dat$GRADES_SERVED_DESC)

dat$has_middle_school <- 
  grepl(pattern="06,07,08", x=dat$GRADES_SERVED_DESC)


# 7. colH gives vals that invariably begin with "9-12 Drop Outs -": the string 
# should be labeled or defined so as to indicate this instead of using 
# redundant articulation in the values. In the remaining portion of these vals, 
# the word "Students" is often used as well and can be probably be eliminated, 
# since it appears that this string exclusively concerns student types.

# 8. colI and colJ appear to have numerical vals (whole numbers and decimals 
# to the nearest tenth, respectively). But some cells are empty: 
# can vals be added here? should they be?





# mess w 'program_percent'
# 
# look at the distribution
summary(dat$PROGRAM_PERCENT)
hist(dat$PROGRAM_PERCENT)
#
# let's say danger as measured by program_percent is something that only 
# applies to high schools
# and let's say that anything above 10% is "disaster", 5-9.9% is "dangerous",
# and less than 5% is "fine"

# first check na's [there are none so we're safe]
table(dat$has_high_school, useNA="always")
table(dat$PROGRAM_PERCENT, useNA="always")

dat$danger <- ifelse(
  dat$has_high_school==TRUE & dat$PROGRAM_PERCENT >= 10, "disaster",
  ifelse(
    dat$has_high_school==TRUE & 
      dat$PROGRAM_PERCENT >= 5 & dat$PROGRAM_PERCENT < 10, "dangerous",
    ifelse(
      dat$has_high_school==TRUE & dat$PROGRAM_PERCENT < 5, "fine", 
      ifelse(
        dat$has_high_school==TRUE & is.na(dat$PROGRAM_PERCENT), "unknown", 
        ifelse(dat$has_high_school==FALSE, NA, "ERROR -- CHECK WORK")
      )
    )
  )
)

table(dat$danger, useNA="always")


# HOMEWORK FOR RYAN:
#   1. use a for-loop to define a new column with the 
#      exact same values as 'danger', and then
#      prove that your new column is identical to 'danger'
#   
#   2. create a new dataframe that lists average newval for each
#      school district
#   
#   3. understand and explain the line that creates 'newval'
#   
#   4. save a version of the manipulated dataset (pretend it's now 'clean')
dat$newval <- rnorm(nrow(dat), 12, 4)

# start here




### 3. save the clean dataset as a csv in ../output ###########################
# === === === === === === === === === === === === === === === === === === 






### scratch area/back of envelope region ######################################
# === === === === === === === === === === === === === === === === === === 

# note that NA will register in unique values if it exists in the vector
# unique(c("a","b","b","c","c","c",NA))






