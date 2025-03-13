#!/bin/bash
#SBATCH --job-name=download_cfsa
#SBATCH --output=download_cfsa%j.out
#SBATCH --error=download_cfsa%j.err
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
chmod +x download_CFSA.sh

# Run the script
./download_CFSA.sh