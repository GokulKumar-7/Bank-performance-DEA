
library(writexl)

library(readxl)
Bank_Data <- read_excel("D:/MSBA/Studies/optimization/Bank Data_Final.xlsx", 
                        col_types = c("text","numeric", "text","numeric", 
                                      "numeric", "numeric", "numeric", "numeric", "numeric"))

#converting into millions
Bank_Data[, c("Total Assets", "Operating Expenses", "Total Deposits", "Net Profit", "Interest Income", "Investment")] <- lapply(Bank_Data[, c("Total Assets", "Operating Expenses", "Total Deposits", "Net Profit", "Interest Income", "Investment")], function(x) x * 10)

statistics <- describe(Bank_Data)

selected_columns <- Bank_Data[, c("Total Assets", "Operating Expenses", "Total Deposits", "Net Profit", "Interest Income", "Investment")]

cor_matrix <- cor(selected_columns, use = "complete.obs", method = "pearson")

# Print the correlation matrix
print(cor_matrix)

df <- Bank_Data

df$time_frame <- ifelse(Bank_Data$FY %in% c("2020"), "Pre", "Post")
prepandemic <- df %>% filter(time_frame == "Pre")
postpandemic <- df %>% filter(time_frame == "Post")

inputs <- as.matrix(prepandemic[, c("Total Assets","Operating Expenses", "Total Deposits")])
outputs <- as.matrix(prepandemic[, c("Net Profit", "Interest Income", "Investment")])

result <- dea(
  X = inputs,          # Input matrix
  Y = outputs,         # Output matrix
  RTS = "vrs",         # Variable returns to scale
  ORIENTATION = "in",  # Input-oriented model
  SLACK = TRUE         # Calculate slack variables
)

vrs_efficiency_scores <- result$eff
prepandemic$vrs_Efficiency_Score <- vrs_efficiency_scores
print(prepandemic[, c("NSE Code", "Bank Name", "vrs_Efficiency_Score")])


inputs <- as.matrix(postpandemic[, c("Total Assets","Operating Expenses", "Total Deposits")])
outputs <- as.matrix(postpandemic[, c("Net Profit", "Interest Income", "Investment")])

result <- dea(
  X = inputs,          # Input matrix
  Y = outputs,         # Output matrix
  RTS = "vrs",         # Variable returns to scale
  ORIENTATION = "in",  # Input-oriented model
  SLACK = TRUE         # Calculate slack variables
)
vrs_efficiency_scores <- result$eff
postpandemic$vrs_Efficiency_Score <- vrs_efficiency_scores
print(postpandemic[, c("NSE Code", "Bank Name", "vrs_Efficiency_Score")])



#translation invariance to make all negative data positive by adding a big enough scalar to the negative variables
min_value <- min(df$`Net Profit`)
shift_scalar <- abs(min_value) + 1  # Adding 1 to ensure positivity
df$`Net Profit` <- df$`Net Profit` + shift_scalar

data_malmquist <- make_malmquist(df,percol=2, arrangement="vertical",inputs=4:6,outputs=7:9) 
result_MI1 <- malmquist_index(data_malmquist, orientation = "io")
result_MI1$mi
result_MI1$ec
result_MI1$tc
