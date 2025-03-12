# CFSR_Data
Download and analysis the CFSR hourly analysis data, and prepare the data at subbasin scale.

# Step 1, Data download
The CFSR data are divided into two parts in the NCEI storage, the CFS-Reanalysis from 1979 to 2011, and CFS-Analysis from 2011 to recent

# Step 2, Using Wgrib2 to subset regions, variables, and convert to NetCDF
The reason for this step is the wgrib2 tool is much faster than Python package, could be used for large dataset

# Step 3, Create masks for subbasins, and calculate areal mean averaged values for models
