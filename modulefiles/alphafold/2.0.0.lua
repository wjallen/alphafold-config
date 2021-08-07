local help_message = [[

This is a conda python environment for AlphaFold which contains:

  - AlphaFold v2.0.0
  - Python v3.7.10
  - TensorFlow v2.5
  - CUDAToolkit v11.1.1
  - ...and more

After loading this module, run AlphaFold using the following command:

  $ run_alphafold.py --flagfile=sample.ff

A sample.ff is provided in:

  /scratch1/03439/wallen/alphafold/test

That file should be customized to point to your own input data (--fasta-paths)
and desired output path (--output-dir).

https://github.com/deepmind/alphafold
https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html

]]

help(help_message,"\n")

whatis("Name: alphafold")
whatis("Version: 2.0.0")
whatis("Category: Biology")
whatis("Keywords: protein folding, sequence alignment, machine learning")
whatis("Description: AlphaFold conda python environment")
whatis("URL: https://github.com/deepmind/alphafold")

always_load("intel/19.1.1")
try_load("cuda/11.0")
try_load("cudnn/8.0.5")
try_load("nccl/2.8.3")
family("python")
 
prepend_path("PATH", "/scratch1/03439/wallen/alphafold/alphafold-2.0.0")

local root_dir = "/scratch1/03439/wallen/alphafold"
local funcs = "conda __conda_activate __conda_hashr __conda_reactivate __add_sys_prefix_to_path"

-- Specify where system and user environments should be created
setenv("CONDA_ENVS_PATH", os.getenv("SCRATCH") .. "/conda_local/envs:" .. root_dir .. "/miniconda/envs")
-- Directories are separated with a comma
setenv("CONDA_PKGS_DIRS", os.getenv("SCRATCH") .. "/conda_local/pkgs:" .. root_dir .. "/miniconda/pkgs")

-- Initialize conda and activate environment
execute{cmd="source " .. root_dir .. "/miniconda/etc/profile.d/conda.sh; conda activate alphafold; export -f " .. funcs, modeA={"load"}}
-- Unload environments and clear conda from environment
execute{cmd="for i in $(seq ${CONDA_SHLVL:=0}); do conda deactivate; done; pre=" .. root_dir .. "/miniconda; \
	export LD_LIBRARY_PATH=$(echo ${LD_LIBRARY_PATH} | tr ':' '\\n' | grep . | grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
	export PATH=$(echo ${PATH} | tr ':' '\\n' | grep . | grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
	unset -f " .. funcs .. "; \
	unset $(env | grep -o \"[^=]*CONDA[^=]*\");", modeA={"unload"}}


