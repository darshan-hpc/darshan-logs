This directory contains 2 Darshan logs corresponding to 2 identical runs of IOR:
 - 1 using POSIX backend
 - 1 using DAOS DFS backend

Each run uses 16 processes on ALCF Aurora and default IOR parameters. These logs
are used as part of a CI test to ensure similarity of Darshan output for POSIX and
DFS I/O interfaces.
