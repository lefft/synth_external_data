# this is the area for defining functions you'll call from `main.r`
# (esp. useful if you find yourself repeating the same code over and over)


# a few examples are below -- just talk to tim if you have questions!


# syntax is illustrated in a simple rounding function:
# (x can be a single number or a vector of numbers)
round_3 <- function(x){
  round(x, digits=3)
}

# you can also set default values for function arguments via `=`
round_n <- function(x, num_dig=3){
  round(x, digits=num_dig)
}

# here's a common lil func that will save you keystrokes:
# ('lu' for 'length unique')
lu <- function(vec, na_omit=FALSE){
  if (na_omit==FALSE){
    return(length(unique(vec)))
  } else {
    return(length(unique(vec[!is.na(vec)])))
  }
}

