This is an example darshan log that contains both runtime
`HEATMAP` and `STDIO` module data, to facilitate reproduction
of an issue with the runtime heatmap data handling at the pydarshan level
when a subset of ranks are inactive. There should be 20 active
and 20 inactive ranks at the `STDIO` level.

The darshan runtime was built off `main` branch at
hash `548d9aed` on a LANL `darwin` `skylake-gold` node

```
module load gcc openmpi
./prepare.sh
cd darshan-runtime/
./configure --prefix=/vast/home/treddy/darshan_install --with-log-path-by-env=DARSHAN_LOGPATH --with-jobid-env=SLURM_JOBID CC=mpicc
make
make install
```

The C code, compiled with mpicc, and monitoring incantation are below:

```
#include <mpi.h>
#include <stdio.h>

int main(int argc, char** argv) {
    MPI_Init(NULL, NULL);
    int world_rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
    if (world_rank % 2 == 0) {
        printf("Hello world from rank %i\n", world_rank);
    }
    MPI_Finalize();
    return 0;
}
```

mpirun -x DXT_ENABLE_IO_TRACE=1 -x DARSHAN_LOGPATH=/vast/home/treddy/rough_work/darshan/issue_730 -x DARSHAN_DISABLE_SHARED_REDUCTION=1 -x LD_PRELOAD=/vast/home/treddy/darshan_install/lib/libdarshan.so -np 40 a.out
