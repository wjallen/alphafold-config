#!/bin/bash
# full_dbs_pylauncher.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_pylauncher             # Job name
#SBATCH -o af2_pylauncher.%j.out      # Name of stdout output file
#SBATCH -e af2_pylauncher.%j.err      # Name of stderr output file
#SBATCH -p normal                     # Queue (partition) name
#SBATCH -N 1                          # Total # of nodes
#SBATCH -t 24:00:00                   # Run time (hh:mm:ss)
#SBATCH -A my_project                 # Project/Allocation name
# -----------------------------------------------------------------

# Load modules
module unload xalt
module load python3 pylauncher
module use /scratch2/projects/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr

echo -n "starting at: "
date

mkdir -p $SCRATCH/af2_pylauncher_out

# Run Alphafold with pylauncher
python3 af2_launcher.py

echo -n "ending at: "
date
