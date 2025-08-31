# Load necessary libraries
library(dplyr)
library(readr)
library(stringr)

# Read the uploaded data
data <- read_csv("Fake.csv")

# Initial exploration
print("Dataset dimensions:")
dim(data)

print("Column names:")
names(data)

print("First few rows:")
head(data)

print("Data structure:")
glimpse(data)

print("Summary statistics:")
summary(data)
