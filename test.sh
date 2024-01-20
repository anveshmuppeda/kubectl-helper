#!/bin/bash

# Data to be printed in a table
name1="John"
age1="25"
city1="New York"

name2="Alice"
age2="30"
city2="San Francisco"

# Calculate the width of the columns
name_width=10
age_width=4
city_width=15

# Function to print a centered string with padding
centered() {
  local width=$1
  local text=$2
  local padding=$((($width - ${#text}) / 2))
  printf "%*s%s%*s" $padding "" "$text" $padding ""
}

# Print table header with centered headers
printf "+%s+%s+%s+\n" "$(centered $name_width 'Name')" "$(centered $age_width 'Age')" "$(centered $city_width 'City')"
printf "|%s|%s|%s|\n" "$(centered $name_width '')" "$(centered $age_width '')" "$(centered $city_width '')"
printf "|%s|%s|%s|\n" "$(centered $name_width "$name1")" "$(centered $age_width "$age1")" "$(centered $city_width "$city1")"
printf "|%s|%s|%s|\n" "$(centered $name_width "$name2")" "$(centered $age_width "$age2")" "$(centered $city_width "$city2")"
printf "+%s+%s+%s+\n" "$(centered $name_width '')" "$(centered $age_width '')" "$(centered $city_width '')"
