#!/bin/bash

# Base URL for data
base_url="https://www.ncei.noaa.gov/oa/prod-cfs-reanalysis/6-hourly-by-pressure-level"

# Start and end dates
start_date="19790101"
end_date="20110331"

# Directory to save the downloaded files
output_dir="/nfs/turbo/seas-yhon/CFSR_data"
# mkdir -p "$output_dir"

# Iterate through the date range
current_date="$start_date"
while [[ "$current_date" -le "$end_date" ]]; do
  # Extract year, month, and day
  year=$(date -d "$current_date" +"%Y")
  month=$(date -d "$current_date" +"%m")
  day=$(date -d "$current_date" +"%d")

  # Loop through the 6-hour intervals (00, 06, 12, 18)
  for hour in 00 06 12 18; do
    # Construct the file name and URL
    file_name="pgbh00.gdas.${year}${month}${day}${hour}.grb2"
    url="${base_url}/${year}/${year}${month}/${year}${month}${day}/${file_name}"
	new_file_name="${year}${month}${day}${hour}.grb2"

    # Download the file
    echo "Downloading: $url"
    if [ ! -f "${output_dir}/${new_file_name}" ]; then
		wget -c --timeout=360 --tries=5 --waitretry=30 -O "${output_dir}/${new_file_name}" "$url"
	else
		echo "File ${output_dir}/${new_file_name} already exists. Skipping download."
	fi

    # Check if the download succeeded
    if [[ $? -ne 0 ]]; then
      echo "Failed to download: $url"
    fi
  done

  # Increment the date by one day
  current_date=$(date -d "$current_date + 1 day" +"%Y%m%d")
done

echo "Download complete. Files saved in $output_dir"
