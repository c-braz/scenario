function create-backups{
param(
	$source = "",
	$destdir = "" 
 )
 
 foreach ($i in 12..1) {
	 $date = (get-date -day 21 -Minute 32 -Hour 15 -Second 39).AddMonths(-$i) 
	 $prefix = $date |Get-Date -Format "yyyy_MM_dd_"; $destname = $prefix + "backup.zip" 
	 $backupname = Join-Path -Path $dest -ChildPath $destname
	 
	 compress-archive $source $backupname 
	 sleep -milliseconds 100
	 
	 $file = Get-ChildItem $backupname 
	 $file.LastWriteTime=($date) 
	 $file.creationTime=($date)
	 $file.LastAccessTime=($date)
 } 
 dir $destdir | ft LastAccessTime,LastWriteTime,CreationTime,Name
}
