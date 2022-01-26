This log has partial data for both DXT_POSIX and DXT_MPIIO modules.

It was collected on a laptop with an `mpi-io-test` configuration that
deliberately issued more I/O operations than will fit within the default
memory buffer size used by DXT.  This is not a file count limit, but rather
a fixed trace buffer size limit.  The log is valid, however, and the DXT
records that were collected prior to hitting the limit can be viewed with
`darshan-dxt-parser --show-incomplete`.
