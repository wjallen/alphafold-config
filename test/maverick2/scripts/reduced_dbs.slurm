#!/bin/bash
# reduced_dbs.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_reduced                   # Job name
#SBATCH -o af2_reduced.%j.out            # Name of stdout output file
#SBATCH -e af2_reduced.%j.err            # Name of stderr error file
#SBATCH -p gtx                           # Queue (partition) name
#SBATCH -N 1                             # Total # of nodes 
#SBATCH -n 1                             # Total # of mpi tasks 
#SBATCH -t 09:00:00                      # Run time (hh:mm:ss)
#SBATCH -A my-project                    # Project/Allocation name 
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /work/projects/tacc/bio/alphafold/modulefiles
module load alphafold/2.1.0-ctr
module list

echo -n "starting at: "
date

mkdir -p $WORK/af2_reduced

# Run AlphaFold2
run_alphafold.sh --flagfile=$AF2_HOME/test/flags/reduced_dbs.ff \
	--fasta_paths=$AF2_HOME/test/input/sample.fasta \
	--output_dir=$WORK/af2_reduced \
	--model_preset=monomer

echo -n "ending at: "
date
