library(tidyverse)
library(rvest)

## SPERLING'S BEST PLACES 
# SOLUTION CODE USING STERLING, VIRGINA AS A DEMO

# TASK 1: Look up the cost of living for your hometown on 
# Sperling's Best Places website: http://www.bestplaces.net/ 
# Then, extract it with `html_elements()` and `html_text2()`

# download the HTML page
sterling <- read_html("http://www.bestplaces.net/cost_of_living/city/virginia/sterling")

# extract the cost of living value
col <- html_elements(sterling, css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)")
html_text2(col)

# do the same thing using a piped operation
sterling %>%
  html_elements(css = "#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)") %>%
  html_text2()


# TASK 2: Get the first table and convert it to a data frame.
# To exact tables use the rvest function html_table()

# extract the first table
tables <- html_elements(sterling, css = "table")
html_table(tables, header = TRUE, fill = TRUE)[[1]]

# do the same thing using a piped operation
tables %>%
  # get the first table using nth() function
  nth(1) %>%
  # convert to data frame
  html_table(header = TRUE)


# TASK 3: Extract the climate statistics table of your hometown

sterling_climate <- read_html("http://www.bestplaces.net/climate/city/virginia/sterling")

# extract the climate table and put it into a data frame
climate <- html_elements(sterling_climate, css = "table")
html_table(climate, header = TRUE, fill = TRUE)[[1]]

# do the same thing using a piped operation
sterling_climate %>%
  html_elements(css = "table") %>%
  nth(1) %>%
  html_table(header = TRUE)
