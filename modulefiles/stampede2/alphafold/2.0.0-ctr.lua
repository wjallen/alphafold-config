local help_message = [[
This is a module file for the container tacc/alphafold:2.0.0, which exposes the
following programs:

 - a3m_database_extract
 - a3m_database_filter
 - a3m_database_reduce
 - a3m_extract
 - a3m_reduce
 - alimask
 - bin2c
 - cmake
 - cpack
 - cstranslate
 - ctest
 - cuobjdump
 - dirmngr
 - estimator_ckpt_converter
 - f2py
 - f2py3
 - fakeroot
 - fatbinary
 - ffindex_apply
 - ffindex_build
 - ffindex_from_fasta
 - ffindex_from_fasta_with_split
 - ffindex_get
 - ffindex_modify
 - ffindex_order
 - ffindex_reduce
 - ffindex_unpack
 - gpgsm
 - hhalign
 - hhalign_omp
 - hhblits
 - hhblits_ca3m
 - hhblits_omp
 - hhconsensus
 - hhfilter
 - hhmake
 - hhsearch
 - hhsearch_omp
 - hmmalign
 - hmmbuild
 - hmmc2
 - hmmconvert
 - hmmemit
 - hmmfetch
 - hmmlogo
 - hmmpgmd
 - hmmpress
 - hmmscan
 - hmmsearch
 - hmmsim
 - hmmstat
 - idle3
 - import_pb_to_tensorboard
 - jackhmmer
 - kalign
 - kbxutil
 - lspgpot
 - lzmadec
 - makehmmerdb
 - markdown_py
 - nhmmer
 - nhmmscan
 - nvcc
 - nvdisasm
 - nvlink
 - nvprof
 - pdbfixer
 - phmmer
 - pip3
 - ptxas
 - pydoc3
 - python3
 - pyvenv
 - saved_model_cli
 - symcryptrun
 - tabulate
 - tensorboard
 - tf_upgrade_v2
 - tflite_convert
 - toco
 - toco_from_protos

This container was pulled from:

https://hub.docker.com/r/tacc/alphafold

If you encounter errors in alphafold or need help running the
tools it contains, please contact the developer at

https://hub.docker.com/r/tacc/alphafold

For errors in the container or module file, please
submit a ticket at

	https://github.com/TACC/rgc/issues
]]

help(help_message,"\\n")

whatis("Name: alphafold")
whatis("Version: 2.0.0")
whatis("Category: Unknown")
whatis("Keywords: Container")
whatis("Description: The alphafold package")
whatis("URL: https://hub.docker.com/r/tacc/alphafold")

local programs = {"a3m_database_extract", "a3m_database_filter", "a3m_database_reduce", "a3m_extract", "a3m_reduce", "alimask", "bin2c", "cmake", "cpack", "cstranslate", "ctest", "cuobjdump", "dirmngr", "estimator_ckpt_converter", "f2py", "f2py3", "fakeroot", "fatbinary", "ffindex_apply", "ffindex_build", "ffindex_from_fasta", "ffindex_from_fasta_with_split", "ffindex_get", "ffindex_modify", "ffindex_order", "ffindex_reduce", "ffindex_unpack", "gpgsm", "hhalign", "hhalign_omp", "hhblits", "hhblits_ca3m", "hhblits_omp", "hhconsensus", "hhfilter", "hhmake", "hhsearch", "hhsearch_omp", "hmmalign", "hmmbuild", "hmmc2", "hmmconvert", "hmmemit", "hmmfetch", "hmmlogo", "hmmpgmd", "hmmpress", "hmmscan", "hmmsearch", "hmmsim", "hmmstat", "idle3", "import_pb_to_tensorboard", "jackhmmer", "kalign", "kbxutil", "lspgpot", "lzmadec", "makehmmerdb", "markdown_py", "nhmmer", "nhmmscan", "nvcc", "nvdisasm", "nvlink", "nvprof", "pdbfixer", "phmmer", "pip3", "ptxas", "pydoc3", "python3", "pyvenv", "saved_model_cli", "symcryptrun", "tabulate", "tensorboard", "tf_upgrade_v2", "tflite_convert", "toco", "toco_from_protos"}
local run_function = "singularity exec /scratch/projects/tacc/bio/alphafold/images/alphafold_2.0.0.sif $RGC_APP"

-- Define shell functions
for i,program in pairs(programs) do
	set_shell_function(program,
		"RGC_APP=" .. program .. "; " .. run_function .. " $@",
		"RGC_APP=" .. program .. "; " .. run_function .. " $*")
end

set_shell_function("run_alphafold.sh", "singularity exec /scratch/projects/tacc/bio/alphafold/images/alphafold_2.0.0.sif /app/run_alphafold.sh $@", "singularity exec /scratch/projects/tacc/bio/alphafold/images/alphafold_2.0.0.sif /app/run_alphafold.sh $*")

-- Export functions on load
execute{cmd="export -f " .. table.concat(programs, " "), modeA={"load"}}
-- Unset functions on unload
execute{cmd="unset -f " .. table.concat(programs, " "), modeA={"unload"}}

setenv("AF2_HOME", "/scratch/projects/tacc/bio/alphafold")
always_load("tacc-singularity")
