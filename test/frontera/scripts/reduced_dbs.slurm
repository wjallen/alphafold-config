#!/bin/bash
# -----------------------------------------------------------------
#SBATCH -J af2_reduced                # Job name
#SBATCH -o af2_reduced.%j.out         # Name of stdout output file
#SBATCH -e af2_reduced.%j.err         # Name of stderr error file
#SBATCH -p rtx                        # Queue (partition) name
#SBATCH -N 1                          # Total # of nodes 
#SBATCH -n 1                          # Total # of mpi tasks 
#SBATCH -t 06:00:00                   # Run time (hh:mm:ss)
#SBATCH -A my-project                 # Project/Allocation name 
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch2/projects/bio/alphafold/modulefiles
module load alphafold/2.0.0-ctr

# Run AlphaFold2
run_alphafold.sh --flagfile=$AF2_HOME/test/flags/reduced_dbs.ff \
                 --fasta_paths=$AF2_HOME/test/input/sample.fasta \
                 --output_dir=$SCRATCH/af2_reduced \
                 --model_names=model_1,model_2,model_3,model_4,model_5 
