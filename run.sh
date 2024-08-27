#PBS -N crujra_accessN96_1h
#PBS -l wd
#PBS -P tm70
#PBS -q normal
#PBS -l walltime=00:20:00
#PBS -l ncpus=4
#PBS -l mem=4GB
#PBS -l storage=gdata/rp23+gdata/tm70
#PBS -j oe

./setup.sh

if hostname -f | grep gadi.nci.org.au > /dev/null; then
    if ldd cable-mpi | grep openmpi/4.1.4 > /dev/null; then
        module add openmpi/4.1.4
    elif ldd cable-mpi | grep intel-mpi/2019.5.281 > /dev/null; then
        module add intel-mpi/2019.5.281
    else
        echo -e "Error: executable compiled with unknown MPI implementation."
        exit 1
    fi
fi

mpiexec -n $PBS_NCPUS ./cable-mpi > logs/cable_log_out.txt 2>&1
