#!/bin/bash
#SBATCH --job-name=download_cfsr
#SBATCH --output=download_cfsr%j.out
#SBATCH --error=download_cfsr%j.err
#SBATCH --time=200:00:00                # Maximum runtime (adjust as needed)
#SBATCH --nodes=1                      # Number of nodes
#SBATCH --ntasks=1                     # Number of tasks
#SBATCH --cpus-per-task=1              # Number of CPUs
#SBATCH --mem=4G                       # Memory per node
#SBATCH --mail-type=ALL                # Notifications for job (BEGIN, END, FAIL, ALL)
#SBATCH --account=yhon0

# Load any necessary modules (if wget is not on PATH by default)
#module load wget

# Make the script executable
chmod +x download_CFSR1.sh
chmod +x download_CFSR2.sh

# Run the script
./download_CFSR1.sh
./download_CFSR2.sh
