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

## Guidelines for submitting new log files

- Anyone can contribute logs for consideration by opening a GitHub pull
  request.
- Make sure that you have permission to publicly share the log (i.e., that
  it does not disclose any proprietary or private information).
  - The `darshan-convert` utility can be used to anonymize logs with the
    `--obfuscate` command line argument if needed.
- If the log file is intended to exercise a particular corner case for CI
  testing, then review existing logs to see if there are any that already
  posses the desired property.
  - A duplicate example may still be warranted to help isolate behavior or
    present a variation on how it is manifested, but it is helpful to be
    aware of the duplication.
- Include relevant details in a `README.md` file for the log (see existing
  logs for examples).
- If the file is greater than 100 MiB in size, then it should be hosted
  externally rather than added directly to the repository.
  - Use a publicly-accessible persistent URL.
  - Follow existing examples for how to constitute the log file in a local
    clone using the `download-large-logs.sh` script and a URL reference
    stored in a `*.darshan.link` file.

There is no formal convention for how to name logs or how to describe them
in the README.md files for now. We may add taxonomies or indices in the future.
