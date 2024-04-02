#!/bin/bash
# reduced_dbs_multimer.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_rdb_mult               # Job name
#SBATCH -o af2_rdb_mult.%j.out        # Name of stdout output file
#SBATCH -e af2_rdb_mult.%j.err        # Name of stderr error file
#SBATCH -p gpu-a100                   # Queue (partition) name
#SBATCH -N 1                          # Total # of nodes 
#SBATCH -n 1                          # Total # of mpi tasks 
#SBATCH -t 12:00:00                   # Run time (hh:mm:ss)
#SBATCH -A my-project                 # Project/Allocation name 
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch/tacc/apps/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr
module list

echo -n "starting at: "
date

mkdir -p $SCRATCH/af2_rdb_mult

# Run AlphaFold2
apptainer exec --env TF_FORCE_UNIFIED_MEMORY=1,XLA_PYTHON_CLIENT_MEM_FRACTION=4.0,OPENMM_CPU_THREADS=8 \
               --nv /scratch/tacc/apps/bio/alphafold/2.3.2/images/alphafold_2.3.2.sif \
               /app/run_alphafold.sh \
               --flagfile=$AF2_HOME/examples/flags/reduced_dbs_multimer.ff \
               --fasta_paths=$AF2_HOME/examples/input/sample_multimer.fasta \
               --output_dir=$SCRATCH/af2_rdb_mult \
               --model_preset=multimer \
               --max_template_date=2020-05-14 \
               --use_gpu_relax=True

echo -n "ending at: "
date
