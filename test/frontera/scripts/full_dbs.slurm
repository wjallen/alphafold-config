#!/bin/bash
# full_dbs.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_full                   # Job name
#SBATCH -o af2_full.%j.out            # Name of stdout output file
#SBATCH -e af2_full.%j.err            # Name of stderr error file
#SBATCH -p rtx                        # Queue (partition) name
#SBATCH -N 1                          # Total # of nodes 
#SBATCH -n 1                          # Total # of mpi tasks 
#SBATCH -t 14:00:00                   # Run time (hh:mm:ss)
#SBATCH -A my-project                 # Project/Allocation name 
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch2/projects/bio/alphafold/modulefiles
module load alphafold/2.1.0-ctr

mkdir -p $SCRATCH/af2_full

# Run AlphaFold2
run_alphafold.sh --flagfile=$AF2_HOME/test/flags/full_dbs.ff \
                 --fasta_paths=$AF2_HOME/test/input/sample.fasta \
                 --output_dir=$SCRATCH/af2_full \
                 --model_preset=monomer

