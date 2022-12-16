This directory contains 2 Darshan logs corresponding to 2 identical runs of IOR:
 - 1 using PnetCDF backend
 - 1 using HDF5 backend

Each run uses 4 processes and default IOR parameters. The Darshan logs contain
instrumentation for the high-level I/O library (i.e., PnetCDF or HDF5) used in
each case. These logs are used as part of a CI test to ensure similarity of
Darshan output for each high-level I/O library.
