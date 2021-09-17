# Log-Changes

Some bash to log file changes. Prints the filename, date and diff.

## Installation

Depending on your system you may have to install inotifywait, e.g.
```bash
sudo apt-get install inotify-tools
```

## Usage

For single files use
```bash
./log_changes.sh FILE
```

If you have a single file which contains all the paths to the files you want to
watch use
```bash
./log_changes_from_file_list.sh FILE_LIST
```
