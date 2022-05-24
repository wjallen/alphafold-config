local help_message = [[
This is a module file for the container tacc/alphafold:2.1.0, which exposes the
following programs:

 - run_alphafold.sh

This container was pulled from:

  https://hub.docker.com/r/tacc/alphafold

If you encounter errors in alphafold or need help running the
tools it contains, please find supporting documentation at:

  https://portal.tacc.utexas.edu/software/alphafold

]]

help(help_message,"\\n")

whatis("Name: alphafold")
whatis("Version: 2.1.0")
whatis("Category: Unknown")
whatis("Keywords: Container")
whatis("Description: The alphafold package")
whatis("URL: https://github.com/deepmind/alphafold")

set_shell_function("run_alphafold.sh", "singularity exec --nv /scratch2/projects/bio/alphafold/images/alphafold_2.1.0.sif /app/run_alphafold.sh $@", "singularity exec --nv /scratch2/projects/bio/alphafold/images/alphafold_2.1.0.sif /app/run_alphafold.sh $*")

setenv("AF2_HOME", "/scratch2/projects/bio/alphafold")
always_load("tacc-singularity")
try_load("cuda/11.0")

