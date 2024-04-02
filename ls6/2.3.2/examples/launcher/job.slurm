#!/bin/bash
# -----------------------------------------------------------------
#SBATCH -J af2_launcher_job            # Job name
#SBATCH -o af2_launcher_job.%j.out     # Name of stdout output file
#SBATCH -e af2_launcher_job.%j.err     # Name of stderr output file
#SBATCH -p gpu-a100                    # Queue (partition) name
#SBATCH -N 2                           # Total # of nodes
#SBATCH -n 6                           # Total # of mpi tasks
#SBATCH -t 16:00:00                    # Run time (hh:mm:ss)
#SBATCH -A my_project                  # Project/Allocation name
# -----------------------------------------------------------------

# Load modules (example path on Frontera)
module unload xalt
module use /scratch/tacc/apps/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr

# Launcher specifics (use launcher_gpu for GPUs)
module load launcher_gpu
export LAUNCHER_JOB_FILE=jobfile

# Run AlphaFold with Launcher
${LAUNCHER_DIR}/paramrun

