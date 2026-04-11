$remotes = git remote
$folder = "Volha_Zhukova/"

#Write-Host "$remotes"

$hasChanges = git status --porcelain $folder

if (-not $hasChanges) {        
        Write-Host "No changes to push"
        exit
    }

$lastfolder = Get-ChildItem -Path $folder -Directory | 
                    Sort-Object Name | 
                    Select-Object -Last 1

$lessonName = if ($lastfolder) { $lastfolder.Name } else { "General Update" }

foreach ($remote in $remotes) {
	Write-Host "$remote in process"
        
    git add $folder    
    git commit -m "$lessonName"
    git push $remote    
}