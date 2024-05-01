#!/bin/bash
# full_dbs_multimer_launcher.slurm
# -----------------------------------------------------------------
#SBATCH -J full_dbs_multimer_launcher             # Job name
#SBATCH -o full_dbs_multimer_launcher.%j.out      # Name of stdout output file
#SBATCH -e full_dbs_multimer_launcher.%j.err      # Name of stderr output file
#SBATCH -p rtx                                    # Queue (partition) name
#SBATCH -N 1                                      # Total # of nodes
#SBATCH -n 3                                      # Total # of mpi tasks
#SBATCH -t 16:00:00                               # Run time (hh:mm:ss)
#SBATCH -A my-project                           # Project/Allocation name 
#SBATCH --mail-type=all                         # Send email at begin and end of job
#SBATCH --mail-user=my-email.edu                # Email address for job updates
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch2/projects/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr

echo -n "starting at: "
date

mkdir -p $SCRATCH/full_dbs_multimer

# Launcher specifics (use launcher_gpu for GPUs)
AF2_HOME="/scratch2/projects/bio/alphafold/2.3.2"
module load launcher_gpu
export LAUNCHER_WORKDIR=$AF2_HOME/examples/scripts/multimer
export LAUNCHER_JOB_FILE=full_dbs_multimer_jobfile

# Run AlphaFold with Launcher
${LAUNCHER_DIR}/paramrun

echo -n "ending at: "
date