# darshan-logs

Repository of example Darshan log files.  Each is in a subdirectory with
it's own README.md describing why that specific log is a notable example.

If a Darshan log is too large to store directly in the git repository, then
the directory will contain a `*.darshan.link` file rather than a `*.darshan`
file.  The link file is just a text file containing the URL to the example
in an externally hosted download site.

You can download all such files at once by running the
`download-large-logs.sh` script at the top level of this repository.
This script will also set the correct path/name for each log so that there
is a corresponding `*.darshan` file alongside each `*.darshan.link` file in
the repository.
