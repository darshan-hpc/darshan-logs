This log file is of interest for generating interesting
DXT Heatmap results in the new darshan Python summary report.

It was generated using:
https://github.com/waltligon/orangefs/blob/master/test/client/mpi-io/mpi-io-test.c 
on the LANL supercomputer `snow`.

On a single `snow` backend node, a command similar to this was used:
mpirun -x DXT_ENABLE_IO_TRACE=1 -x DARSHAN_LOGPATH=/path/to/darshan_logs -x DARSHAN_DISABLE_SHARED_REDUCTION=1 -x LD_PRELOAD=/path/to/lib/libdarshan.so -np 32 mpi-io-test -i 4 -v

The printed output from the app:

```
nr_procs = 32, nr_iter = 4, blk_sz = 16777216, coll = 0 
# total_size = 2147483648
# Write: min_t = 2.686803, max_t = 7.584249, mean_t = 5.374464, var_t = 1.722304
# Read:  min_t = 0.813663, max_t = 2.657060, mean_t = 1.740801, var_t = 0.153192
Write bandwidth = 283.150451 Mbytes/sec
Read bandwidth = 808.218043 Mbytes/sec
```
