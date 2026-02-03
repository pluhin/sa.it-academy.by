$url1 = "git@github.com:poteenoka/ItAcademi_3lesson.git"
$url2 = "git@gitlab.com:poteenoka/itacademi_3lesson.git"
$logFile = "sync_log.txt"
$stage = ""

function Get-CommitHistory {
    git log --oneline --all | Out-String
}

function Push-ToRemote($url) {
    git remote set-url origin $url
    $pushResult = git push origin
    return $pushResult
}

function Write-Log($message) {
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $message" | Out-File -FilePath $logFile -Append
}

try {
    $stage = Get-CommitHistory
    
    while ($true) {
        write-host "Current stage is: $stage " -ForegroundColor Green 
    
        Start-Sleep -Seconds 60
        
        $current = Get-CommitHistory
    
        if ($current -ne $stage) {
            
            $push1 = Push-ToRemote $url1
            if ($LASTEXITCODE -ne 0) {
                Write-Log "FAIL: Push to $url1 failed: $push1"
                exit 1
            }
            
            $push2 = Push-ToRemote $url2
            if ($LASTEXITCODE -ne 0) {
                Write-Log "FAIL: Push to $url2 failed: $push2"
                exit 1
            }
            
            $stage = $current
            Write-Log "SUCCESS: Changes pushed to both repos"
        }
    }
}
catch {
    Write-Log "ERROR: $($_.Exception.Message)"
    exit 1
}