# Backup Microsoft Edge bookmarks
This script backs up your Chromium based Microsoft Edge bookmarks automatically once a day. If you don't want to use the Edge browser's bookmark sync feature or sync is disabled in your browser by your organization, this script lets you save your bookmarks to an alternative location.

Make sure that your backup folder is synced with a file hosting service (OndeDrive, Google Drive, Dropbox, etc...) so you can restore your bookmarks later on.

# Usage
- Copy the `backup-edge-bookmarks.ps1` to your local machine.
- Open a **PowerShell window in administrator mode**.
- Change your current directory in PowerShell where you downloaded the `backup-edge-bookmarks.ps1` file.
- Type the following command to be able to run the script: `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser` and type 'yes'.
- Run the script: 
	`./backup-edge-bookmarks.ps1`
  
The script uses the Windows Task Scheduler to automatically backup your bookmarks. This feature requires PowerShell in administrator mode.
