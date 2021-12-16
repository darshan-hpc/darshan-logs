This log is notable for having POSIX records which total
to nearly 1 second of I/O time out of ~30 seconds runtime;
a small but visible ratio of I/O activity to total runtime
when plotted.

This ratio was sufficient to detect a bug in the pydarshan
analysis code described in:
https://github.com/darshan-hpc/darshan/issues/590
