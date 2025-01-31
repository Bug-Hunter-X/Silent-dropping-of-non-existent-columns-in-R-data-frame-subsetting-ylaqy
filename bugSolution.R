```r
# Solution 1: Using `dplyr`'s `select` which throws an error if columns don't exist
library(dplyr)
df <- data.frame(A = 1:3, B = 4:6)
cols_to_select <- c("A", "C", "D")

#This will throw an error because "C" and "D" don't exist
subset_df <- df %>% select(all_of(cols_to_select))

# Solution 2: Checking for column existence before subsetting
df <- data.frame(A = 1:3, B = 4:6)
cols_to_select <- c("A", "C", "D")

existing_cols <- intersect(cols_to_select, names(df))
if (length(existing_cols) != length(cols_to_select)){
  warning("Not all specified columns exist in the data frame.")
}
subset_df <- df[, existing_cols]

#Solution 3: Using `select` with `one_of` which silently drops non-existent columns but provides a warning
subset_df <- df %>% select(one_of(cols_to_select))

```