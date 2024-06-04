#!/bin/bash
# full_dbs_launcher.slurm
# -----------------------------------------------------------------
#SBATCH -J af2_launcher_job                         # Job name
#SBATCH -o af2_launcher_job.%j.out                  # Name of stdout output file
#SBATCH -e af2_launcher_job.%j.err                  # Name of stderr output file
#SBATCH -p pvc                                      # Queue (partition) name
#SBATCH -N 1 # Only request one node on pvc Queue   # Total # of nodes
#SBATCH -n 3                                        # Total # of mpi tasks
#SBATCH -t 16:00:00                                 # Run time (hh:mm:ss)
#SBATCH -A my_project                               # Project/Allocation name
# -----------------------------------------------------------------

# Load modules (example path on Frontera)
module unload xalt
module use /scratch/tacc/apps/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr

echo -n "starting at: "
date

mkdir -p $SCRATCH/af2_launcher_job

# Launcher specifics (use launcher_gpu for GPUs)
module load launcher_gpu
export LAUNCHER_JOB_FILE=jobfile

# Run AlphaFold with Launcher
${LAUNCHER_DIR}/paramrun

echo -n "ending at: "
date