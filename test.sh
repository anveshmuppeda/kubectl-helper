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

# Print table header with centered headers
printf "+%-*s+%-*s+%-*s+\n" "$name_width" "Name" "$age_width" "Age" "$city_width" "City"
printf "|%*s+%*s+%*s+\n" "$name_width" "" "$age_width" "" "$city_width" ""
printf "|%*s|%*s|%*s|\n" "$name_width" "$name1" "$age_width" "$age1" "$city_width" "$city1"
printf "|%*s|%*s|%*s|\n" "$name_width" "$name2" "$age_width" "$age2" "$city_width" "$city2"
printf "+%-*s+%-*s+%-*s+\n" "$name_width" "" "$age_width" "" "$city_width" ""
