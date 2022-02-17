This is an example darshan log that contains both runtime
heatmap module data and DXT tracing, to facilitate both
visual and robust numerical comparison of the two approaches
of generating heatmaps in the new Python summary report.

The log follows the following "graphical" IO pattern
of writing only a single byte of data per rank, for each
of 32 ranks, on staggered/exaggerated delays:

Time Bins -->
Rank 
|
|
V
      31        x
      30       x
      29      x
      28     x
      ..
      3    x
      2   x
      1  x
      0 x
       
The example application code used to generate the log
is available here:
https://github.com/tylerjereddy/heatmap_diagonal

In particular, commit hash `4712f54` from that project
was used, and the precise timing and related details
may be obtained from that project. In short, 32 bytes (1 per rank)
were written at minor timing offsets in a Python mpi4py-based
module on a single node of the LANL snow supercomputer
(Intel skylake gold). Only, POSIX, DXT_POSIX, and
(runtime) HEATMAP modules should be present. There is
no *read* activity in the log (just 1 byte written
per rank).

The commit hash of the darshan main branch used to build
the darshan runtime was `b4932a02a`.

Here is the command line that was used on a 
snow backend node:
`mpirun -x DXT_ENABLE_IO_TRACE=1 -x DARSHAN_LOGPATH=/yellow/users/treddy/generated_darshan_logs -x DARSHAN_DISABLE_SHARED_REDUCTION=1 -x LD_PRELOAD=/yellow/users/treddy/darshan_install/lib/libdarshan.so -np 32 python heatmap_diagonal.py`

Here are the steps there were followed to build
the `darshan-runtime` on a snow backend:

```
module load gcc/9.3.0
module load openmpi/3.1.6
module load hdf5-parallel/1.10.7
./prepare.sh
cd darshan-runtime/
./configure --prefix=/yellow/users/treddy/darshan_install --with-log-path-by-env=DARSHAN_LOGPATH --with-jobid-env=SLURM_JOBID --enable-hdf5-mod --with-hdf5=/usr/projects/hpcsoft/toss3/snow/hdf5/1.10.7_gcc-9.3.0_openmpi-3.1.6 CC=mpicc
make
make install
```
