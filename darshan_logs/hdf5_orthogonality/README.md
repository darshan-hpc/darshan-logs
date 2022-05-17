This log file contains H5D data, but not H5F data,
to represent this new scenario that is now possible
based on:
https://github.com/darshan-hpc/darshan/pull/703

The darshan runtime was compiled at main branch hash
2c0ea4d5 with this configure command:

./configure --prefix=/home/treddy/installs/darshan_install --with-log-path-by-env=DARSHAN_LOGPATH --with-jobid-env=SLURM_JOBID --enable-hdf5-mod --with-hdf5=/home/treddy/github_projects/spack/opt/spack/linux-ubuntu22.04-skylake/gcc-11.2.0/hdf5-1.12.2-epig3jbrnmusn47cj3ez7m5oto4gg3bk CC=mpicc

The following short script and monitoring commands were used,
along with the runtime configuration file at the bottom.


```python
import numpy as np
from mpi4py import MPI
import h5py


def handle_io(rank_val, n_bytes):
    bytes_to_write = np.void(bytes(1) * n_bytes)
    with h5py.File(f"rank_{rank_val}.h5", "w") as f:
        f.create_dataset("dataset", data=bytes_to_write)


def main():
    comm = MPI.COMM_WORLD
    rank = comm.Get_rank()

    handle_io(
        rank_val=rank,
        n_bytes=5,
    )


if __name__ == "__main__":
    main()
```

mpirun -x LD_PRELOAD=/home/treddy/installs/darshan_install/lib/libdarshan.so:/home/treddy/github_projects/spack/opt/spack/linux-ubuntu22.04-skylake/gcc-11.2.0/hdf5-1.12.2-epig3jbrnmusn47cj3ez7m5oto4gg3bk/lib/libhdf5.so -x DARSHAN_CONFIG_PATH=/home/treddy/rough_work/darshan/issue_709/runtime_config.txt -x DARSHAN_LOGPATH=/home/treddy/rough_work/darshan/issue_709 -np 3 python test.py

```
MOD_ENABLE STDIO,POSIX,DXT_POSIX,H5D
MOD_DISABLE H5F
DISABLE_SHARED_REDUCTION 1
```
