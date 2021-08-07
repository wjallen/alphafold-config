#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of stdout output file
#SBATCH -e myjob.e%j       # Name of stderr error file
#SBATCH -p rtx             # Queue (partition) name
#SBATCH -N 1               # Total # of nodes 
#SBATCH -n 1               # Total # of mpi tasks 
#SBATCH -t 02:00:00        # Run time (hh:mm:ss)
#SBATCH -A TACC-SCI        # Project/Allocation name 

# You can also put the module loads here
module use /scratch1/03439/wallen/alphafold/modulefiles
module load alphafold/2.0.0

# Launch serial code...
run_alphafold.py --flagfile=/scratch1/03439/wallen/alphafold/test/sample.ff

