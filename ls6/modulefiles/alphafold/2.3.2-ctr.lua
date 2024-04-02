local help_message = [[
This is a module file for the container tacc/alphafold:2.3.2, which exposes the
following program:

 - run_alphafold.sh

This container was pulled from:

  https://hub.docker.com/r/tacc/alphafold

If you encounter errors in alphafold or need help running the
tools it contains, please find supporting documentation at:

  https://portal.tacc.utexas.edu/software/alphafold

]]

help(help_message,"\\n")

whatis("Name: alphafold")
whatis("Version: 2.3.2")
whatis("Category: Unknown")
whatis("Keywords: Container")
whatis("Description: The alphafold package")
whatis("URL: https://github.com/deepmind/alphafold")

set_shell_function("run_alphafold.sh", "apptainer exec --nv /scratch/tacc/apps/bio/alphafold/2.3.2/images/alphafold_2.3.2.sif /app/run_alphafold.sh $@", "apptainer exec --nv /scratch/tacc/apps/bio/alphafold/2.3.2/images/alphafold_2.3.2.sif /app/run_alphafold.sh $*")

setenv("AF2_HOME", "/scratch/tacc/apps/bio/alphafold/2.3.2")
always_load("tacc-apptainer")
try_load("cuda/11.4")

