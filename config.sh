INPUT=(
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/LWdown/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/PSurf/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/Qair/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/Rainf/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/Snowf/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/SWdown/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/Tair/*'
    '/g/data/rp23/data/no_provenance/met_forcing/crujra_accessN96_1h/Wind/*'
    '/g/data/rp23/data/no_provenance/gridinfo/crujra_accessN96_gridinfo.nc'
    '/g/data/rp23/data/no_provenance/landmask/crujra_accessN96_landmask.nc'
    '/g/data/tm70/sb8430/crujra_accessN96_reduced_landmask/crujra_accessN96_reduced_landmask.nc'
)

# Use shell parameter expansion for runtime configurability - see
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html:
: "${EXE:=/home/189/sb8430/cable/bin/cable-mpi}"
