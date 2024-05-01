#!/bin/bash
# full_dbs_monomer.slurm
# -----------------------------------------------------------------
#SBATCH -J full_dbs_monomer                     # Job name
#SBATCH -o full_dbs_monomer.%j.out              # Name of stdout output file
#SBATCH -e full_dbs_monomer.%j.err              # Name of stderr error file
#SBATCH -p rtx                                  # Queue (partition) name
#SBATCH -N 1                                    # Total # of nodes 
#SBATCH -n 1                                    # Total # of mpi tasks 
#SBATCH -t 12:00:00                             # Run time (hh:mm:ss)
#SBATCH -A my-project                           # Project/Allocation name 
#SBATCH --mail-type=all                         # Send email at begin and end of job
#SBATCH --mail-user=my-email.edu                # Email address for job updates
# -----------------------------------------------------------------

# Load modules
module unload xalt
module use /scratch2/projects/bio/alphafold/modulefiles
module load alphafold/2.3.2-ctr
module list

echo -n "starting at: "
date

mkdir -p $SCRATCH/full_dbs_monomer

# Run AlphaFold2
AF2_HOME="/scratch2/projects/bio/alphafold/2.3.2"
run_alphafold.sh --flagfile=$AF2_HOME/examples/flags/full_dbs.ff \
                 --fasta_paths=$AF2_HOME/examples/input/monomer/sample.fasta \
                 --output_dir=$SCRATCH/full_dbs_monomer \
                 --model_preset=monomer \
                 --max_template_date=2020-05-14 \
                 --use_gpu_relax=True

echo -n "ending at: "
date