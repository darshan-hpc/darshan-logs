These example logs were produced from running the E3SM-IO
benchmark (https://github.com/Parallel-NetCDF/E3SM-IO) on the
Theta system at ALCF. 512 processes were used on 8 Theta
compute nodes to run a larger-scale I case benchmark
(i_case_1344p.nc input file, mentioned in E3SM-IO install docs).
PnetCDF is used for writing output data for 300 records(in
canonical format). Example command line used to generate these
logs are:

`e3sm_io /projects/radix-io/E3SM-IO-inputs/i_case_1344p.nc -k -o /projects/radix-io/snyder/e3sm/can_I_out.nc -a pnetcdf -x canonical -r 300`

Notably, the "e3sm_io_heatmap_and_dxt.darshan" log contains
both HEATMAP and DXT data that can be used to compare
approaches for generating heatmap summaries in PyDarshan job
summary reports. The "e3sm_io_heatmap_only.darshan" log is
from a separate run (with identical E3SM-IO configuration),
but with DXT tracing disabled.

These logs were generated not from a tagged Darshan release,
but from commit hash `b4932a0`.
