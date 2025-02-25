#PBS -N crujra_accessN96_1h
#PBS -l wd
#PBS -P tm70
#PBS -q normal
#PBS -l walltime=00:20:00
#PBS -l ncpus=2
#PBS -l mem=4GB
#PBS -l storage=gdata/rp23+gdata/tm70
#PBS -j oe

NCPUS_DEFAULT=4
NRUNS_DEFAULT=1

set -e

host_gadi() {
    libmpi_path_segments=($(ldd cable-mpi | awk '/=>/{print $(NF-1)}' | sed 's/\// /g' | grep libmpi.so))
    mpi_modulefile="${libmpi_path_segments[1]}/${libmpi_path_segments[2]}" # module_name/module_version
    if ! module is-avail ${mpi_modulefile}; then
        echo -e "Error: executable compiled with unknown MPI implementation."
        exit 1
    fi
    module load ${mpi_modulefile}
    NCPUS=${PBS_NCPUS}
}

for i in $(seq ${NRUNS:=${NRUNS_DEFAULT}}); do
    ./clean.sh
    ./setup.sh
    if hostname -f | grep gadi.nci.org.au > /dev/null; then host_gadi; fi
    mpiexec -n ${NCPUS:=${NCPUS_DEFAULT}} ./cable-mpi > logs/cable_log_out.txt 2>&1
    output_dir=$(./save.sh)
    # Point the RESTART environment variable to the previous restart directory for the next run
    export RESTART=$(pwd)/${output_dir}/restart
done
