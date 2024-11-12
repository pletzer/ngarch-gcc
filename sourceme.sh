# spack doesn't like modules to be loaded
module purge

# Load compiler and LFRic dependency packages
. /nesi/nobackup/niwa99999/hayekws/gcc_offloading/spack/share/spack/setup-env.sh
spack load gcc@12 intel-oneapi-mpi yaxt xios py-psyclone py-jinja2 py-sympy rose-picker fcm perl-xml-parser

# Set up build environment - need to use binutils from GCC9 module here for compatibility
export FC=gfortran FPP="cpp -P -x f95-cpp-input" FFLAGS="-B/opt/nesi/CS500_centos7_skl/binutils/2.32-GCCcore-9.2.0/bin -I$(spack location -i intel-oneapi-mpi)/mpi/latest/include/mpi/gfortran-12.2.0 -I$(spack location -i xios)/include -I$(spack location -i netcdf-fortran)/include -I$(spack location -i yaxt)/include"
export LDMPI=mpif90 LDFLAGS="-B/opt/nesi/CS500_centos7_skl/binutils/2.32-GCCcore-9.2.0/bin -L$(spack location -i xios)/lib -Wl,-rpath=$(spack location -i xios)/lib -L$(spack location -i yaxt)/lib -Wl,-rpath=$(spack location -i yaxt)/lib -L$(spack location -i netcdf-fortran)/lib -Wl,-rpath=$(spack location -i netcdf-fortran)/lib -L$(spack location -i netcdf-c)/lib -Wl,-rpath=$(spack location -i netcdf-c)/lib -L$(spack location -i hdf5)/lib -Wl,-rpath=$(spack location -i hdf5)/lib"


