#!/bin/bash
set -e

to_save=(outputs restart input logs)

for path in ${to_save[@]}; do
    if [ ! -f ${path} ] && [ ! -d ${path} ]; then
        echo "Error: ${path} does not exist" >&2
        exit 1
    fi
done

archive_dir=./archive
mkdir -p ${archive_dir}

# See https://stackoverflow.com/questions/11307257/is-there-a-bash-command-which-counts-files
output_count=$(ls 2>/dev/null -Ubad1 -- ${archive_dir}/* | wc -l)
output_dir_name="${archive_dir}/output$(printf "%03d" ${output_count})"
mkdir ${output_dir_name}

for path in ${to_save[@]}; do
    mv ${path} ${output_dir_name}
done

# Echo the output directory for the caller on success
echo ${output_dir_name}
