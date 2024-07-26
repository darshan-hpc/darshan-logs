This directory contains a set of Darshan logs generated over the course of an execution of a non-MPI workflow (specifically the AthenaMP framework for ATLAS workflows). This workflow is comprised of a set of serial processes that have data dependencies. The list of processes involved in this workflow is detailed below:
 * main.darshan: parent process responsible for driving the workflow
 * worker\_[0-7].darshan: worker processes read their own input ROOT data files and produce their own output in shared memory (i.e., not in a file)
 * shared\_writer.darshan: standalone process writing ROOT data that workers put into shared memory
