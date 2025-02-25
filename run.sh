#PBS -N crujra_accessN96_1h
#PBS -l wd
#PBS -P tm70
#PBS -q normal
#PBS -l walltime=02:00:00
#PBS -l ncpus=1
#PBS -l mem=4GB
#PBS -l storage=gdata/rp23+gdata/tm70
#PBS -j oe

NRUNS_DEFAULT=1

set -e

for i in $(seq ${NRUNS:=${NRUNS_DEFAULT}}); do
    ./clean.sh
    ./setup.sh
    ./cable > logs/cable_log_out.txt 2>&1
    output_dir=$(./save.sh)
    # Point the RESTART environment variable to the previous restart directory for the next run
    export RESTART=$(pwd)/${output_dir}/restart
done
