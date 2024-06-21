# Install and load necessary packages
if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}
if (!require("TTR")) {
  install.packages("TTR")
  library(TTR)
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}
# Retrieve Apple stock data
getSymbols("AAPL", from = "1980-01-01", to = Sys.Date())
apple_stock <- AAPL
# Inspect the structure of the data
str(apple_stock)
# Convert to data frame for easier manipulation
apple_stock_df <- data.frame(date = index(apple_stock), coredata(apple_stock))
# Check the first few rows to ensure data is correct
head(apple_stock_df)
# Calculate moving averages
apple_stock_df$MA5 <- SMA(apple_stock_df$AAPL.Close, n = 5)
apple_stock_df$MA50 <- SMA(apple_stock_df$AAPL.Close, n = 50)
apple_stock_df$MA200 <- SMA(apple_stock_df$AAPL.Close, n = 200)
# Plotting the stock data with moving averages
ggplot(apple_stock_df, aes(x = date)) +
  geom_line(aes(y = AAPL.Close), color = "black", size = 1) +
  geom_line(aes(y = MA5), color = "blue", size = 1) +
  geom_line(aes(y = MA50), color = "green", size = 1) +
  geom_line(aes(y = MA200), color = "red", size = 1) +
  labs(title = "Apple Stock Price with Moving Averages",
       x = "Date",
       y = "Price",
       color = "Legend") +
  scale_x_date(date_labels = "%b %Y", date_breaks = "3 months") +
  theme_minimal() +
  theme(legend.position = "bottom") +
  scale_color_manual(values = c("Close" = "black", "MA5" = "blue", "MA50" = "green", "MA200" = "red"))

if (!require("writexl")) {
  install.packages("writexl")
  library(writexl)
}
# Write the data frame to an Excel file
write_xlsx(apple_stock_df, path = "apple_stock_data.xlsx")
