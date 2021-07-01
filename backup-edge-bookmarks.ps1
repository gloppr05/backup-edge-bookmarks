Write-Host "Backup Microsoft Edge bookmarks v1.0"
Write-Host "Homepage: https://github.com/gloppr05/backup-edge-bookmarks`n"

function main {
	$bookmarksPath = "$($Env:USERPROFILE)\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"
	
	if ( -not ( Test-Path -Path $bookmarksPath -PathType leaf ) ) {
		Write-Host "Cannot find Edge bookmarks."
		exit -1
	}
		
	$backupPath = Read-Host "Where do you want to backup your bookmarks? (eg.: c:\users\john\backup)"
	if ( -not ( Test-Path -Path $backupPath ) ) {
		Write-Host "This backup location does not exist. Please create it first."
		exit -1
	}
	
	Copy-Item $bookmarksPath -Destination $backupPath
	
	$taskName = "Backup Edge bookmarks"
	removeTask $taskName
	createTask $taskName $bookmarksPath $backupPath
	
	Write-Host "Ok, your Edge bookmarks will be backed up automatically every time you log in."
}

function createTask {
    param(
        $taskName,
		$bookmarksPath,
		$backupPath
    )

    removeTask $taskName
    $action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c copy /Y /V `"$bookmarksPath`" `"$backupPath`""
    $trigger = New-ScheduledTaskTrigger -AtLogOn -User $(whoami)
    Register-ScheduledTask -TaskName "$taskName" -Action $action -Trigger $trigger | Out-Null
}

function removeTask {
    param(
        $taskName
    )
	
    Unregister-ScheduledTask -TaskName "$taskNamePrefix$taskName" -ErrorAction SilentlyContinue -Confirm:$false
}

main