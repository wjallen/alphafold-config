#!/bin/bash
# reduced_dbs.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_reduced                   # Job name
#SBATCH -o af2_reduced.%j.out            # Name of stdout output file
#SBATCH -e af2_reduced.%j.err            # Name of stderr error file
#SBATCH -p gpu-a100                      # Queue (partition) name
#SBATCH -N 1                             # Total # of nodes 
#SBATCH -n 1                             # Total # of mpi tasks 
#SBATCH -t 08:00:00                      # Run time (hh:mm:ss)
#SBATCH -A my-project                    # Project/Allocation name 
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch/tacc/apps/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr
module list

echo -n "starting at: "
date

mkdir -p $SCRATCH/af2_reduced

# Run AlphaFold2
run_alphafold.sh --flagfile=$AF2_HOME/examples/flags/reduced_dbs.ff \
                 --fasta_paths=$AF2_HOME/examples/input/sample.fasta \
                 --output_dir=$SCRATCH/af2_reduced \
                 --model_preset=monomer \
                 --max_template_date=2020-05-14 \
                 --use_gpu_relax=True

echo -n "ending at: "
date
