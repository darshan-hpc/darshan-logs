Set of example darshan logs that contain `H5D` and/or `H5F` module data
to allow for "ground truth" verification for various data aggregation
functions in the new Python summary report.

The logs were generated using the Python `h5py` library with an HDF5
configuration that was not using MPI-IO. The example application code
used to generate these logs along with some of the execution details
are available here: https://github.com/nawtrey/darshan_hdf5_testing

A brief summary of each log's contents:

| Log                                   | Modules                            | Description                                      |
|---------------------------------------|------------------------------------|--------------------------------------------------|
| `hdf5_file_opens_only`                | `POSIX`, `H5F`                     | 3 ranks open files                               |
| `hdf5_diagonal_write_1_byte_dxt`      | `POSIX`, `DXT_POSIX`, `H5F`, `H5D` | 10 ranks open files, write 1 byte each           |
| `hdf5_diagonal_write_bytes_range_dxt` | `POSIX`, `DXT_POSIX`, `H5F`, `H5D` | 10 ranks open files, write 10-100 bytes each     |
| `hdf5_diagonal_write_half_flush_dxt`  | `POSIX`, `DXT_POSIX`, `H5F`, `H5D` | 10 ranks open files, write 1 byte, 5 ranks flush |
| `hdf5_diagonal_write_half_ranks_dxt`  | `POSIX`, `DXT_POSIX`, `H5F`, `H5D` | 10 ranks open files, 5 ranks write 1 byte        |


These were created on a single node of the LANL snow supercomputer. The
commit hash of the darshan main branch used to build `darshan-runtime`
is `c805d948`, and it was compiled with the `HEATMAP` module disabled.
