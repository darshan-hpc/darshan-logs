This directory contains logs generated for every 3.x version of Darshan.
These logs are generated as part of the release process and are intended
to ensure Darshan maintains backwards compatibility for parsing log files
generated by older versions of the library.

These test logs are generated with the mpi-io-test benchmark that is
distributed as part of Darshan's internal regression testing framework
(darshan-test/regression/test-cases/src/mpi-io-test.c). The benchmark
is executed using 4 processes and uses all default parameters to mpi-io-test.
Logs are generated on an x86_64 architecture for all releases. Logs are
also generated on ppc architecure up until version 3.1.8.
