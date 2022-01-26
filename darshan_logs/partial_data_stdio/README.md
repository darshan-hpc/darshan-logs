This log has partial data for the STDIO module.

It was collected on a laptop with an artificial test case that intentionally
opened more than 1024 files using the STDIO interface (i.e., `fopen()`).
Darshan's default internal limit is 1024 files, so this caused the stdio
module to flag it's data as "incomplete".  The log is valid, however, and
the stdio records that were collected prior to hitting the limit can be
viewed with `darshan-parser --show-incomplete`.
