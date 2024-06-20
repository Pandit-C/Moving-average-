setwd("D:/DAT 201 Data analytics and modelling/Riipen project")
print(getwd())
df <- read.csv("AAPL.csv")
head(df)
# Calculate the 200-day moving average
moving_avg <- SMA(df$Close, n = 200)
# Interpolate missing values
df$Close <- na.approx(df$Close)
# Calculate the 200-day moving average
moving_avg <- SMA(df$Close, n = 200)
# Plot the original closing prices
plot(df$Close, type = "l", col = "blue", xlab = "Time", ylab = "Price", main = "Closing Prices and Moving Average")
# Add the moving average to the plot
lines(moving_avg, col = "red")
# Add a legend
legend("topright", legend = c("Closing Price", "200-day SMA"), col = c("blue", "red"), lty = 1)
# Ensure df$Date is in Date format (if not already)
df$Date <- as.Date(df$Date)

# Calculate the 5-day moving average
moving_avg <- SMA(df$Close, n = 200)

# Plot with dates on x-axis
plot(df$Date, df$Close, type = "l", col = "blue", xlab = "Date", ylab = "Price", main = "Closing Prices and Moving Average")

# Add the moving average to the plot
lines(df$Date, moving_avg, col = "red")

# Add a legend
legend("topright", legend = c("Closing Price", "50-day SMA"), col = c("blue", "red"), lty = 1)
# Ensure df$Date is in Date format (if not already)
df$Date <- as.Date(df$Date)

# Calculate the 5-day moving average
moving_avg <- SMA(df$Close, n = 200)

# Create a new dataframe/table for the results
moving_avg_table <- data.frame(Date = df$Date, Close = df$Close, Moving_Avg = moving_avg)

# Print the table
print(moving_avg_table)
# Ensure df$Date is in Date format (if not already)
df$Date <- as.Date(df$Date)

# Calculate the 200-day moving average
moving_avg <- SMA(df$Close, n = 200)

# Create a new dataframe for the results
moving_avg_table <- data.frame(Date = df$Date, Close = df$Close, Moving_Avg = moving_avg)

# Write the dataframe to a CSV file
write.csv(moving_avg_table, file = "moving_avg_results200.csv", row.names = FALSE)

# Print a message indicating the file has been created
cat("CSV file 'moving_avg_results200.csv' has been created.\n")
