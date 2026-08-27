# GotYourBack

A simple interactive Bash script that creates a compressed backup of a chosen directory, with an optional feature to automatically delete old backups after a set number of days.

## Features

- Prompts the user for a directory to back up
- Verifies the directory exists before proceeding
- Creates a timestamped, compressed archive (`.tar.gz`) of the directory
- Optional automatic cleanup: deletes previous backups (matching the same directory name) older than a user-specified number of days
- Validates numeric input for the retention period
- Accepts flexible Y/N/Yes/No input (case-insensitive)

## Requirements

- Bash
- Standard Unix tools: `tar`, `find`, `date`
- Linux, macOS, or WSL on Windows

## Usage

```bash
chmod +x GotYourBack.sh
./GotYourBack.sh
```

You'll be prompted for:
1. The name of the directory to back up
2. Whether to enable automatic deletion of old backups
3. (If enabled) The number of days after which old backups should be deleted

## Possible Future Improvements

- [ ] Support excluding specific files/folders from the backup (`tar --exclude`)
- [ ] Let the user choose a custom backup destination folder instead of the current directory
- [ ] Add logging of each run (timestamp, success/failure, backup size) to a log file
- [ ] Handle trailing slashes/nested paths in the directory name using `basename`
- [ ] Add exit-status checking after the `tar` command to confirm the backup succeeded
- [ ] Support non-interactive use via command-line flags or a config file (for automation/cron)
- [ ] Add a `--dry-run` mode to preview actions without making changes
- [ ] Generate a checksum (e.g. `sha256sum`) alongside each backup for integrity verification

