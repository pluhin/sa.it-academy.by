$remotes = git remote
$folder = "Volha_Zhukova/"

#Write-Host "$remotes"

$hasChanges = git status --porcelain $folder

foreach ($remote in $remotes) {
	Write-Host "$remote in process"
    if ($hasChanges) {
        git add $folder
        $date = Get-Date -Format "yyyy-MM-dd HH:mm"
        git commit -m "Update Volha_Zhukova at $date"
        git push $remote
    } else {
        Write-Host "No changes to push"
    }
}