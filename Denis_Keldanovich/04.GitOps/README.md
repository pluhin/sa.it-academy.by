## Github cation yaml

```
name: CI. Tabs counter
 
on: [push, pull_request]
 
jobs:
  make:
    runs-on: ubuntu-latest
    #runs-on: self-hosted
 
    steps:
      - name: Get changed files
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
 
      - name: Get changed files
        id: ch-files
        uses: tj-actions/changed-files@v34
 
      - name: Count tabs in all changed files one by one
        run: |
          for file in ${{ steps.ch-files.outputs.all_changed_files }}; do
            echo "File $file was changed and has `tr -cd '\t' < $file | wc -m` tabs." >> result.log
            echo "`tr -cd '\t' < $file`" >> total.log
          done
 
      - name: Count total tabs in all changed files
        run: |
          echo "Total tabs in all changed files is >> `tr -cd '\t' < total.log | wc -c` tabs." >> result.log
 
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: result.log
```
## Repository
[GitHub](https://github.com/Keldanovich/new_repo)
## Action
[GitHub](https://github.com/ArtsiomBorisevich/03.git.hosting/actions/runs/3508960975/jobs/5877737867)
## Artifact
```
 File .github/workflows/action.yaml was changed and has 0 tabs.
 File 04/.gitkeep was changed and has 0 tabs.
 File 04/README.md was changed and has 0 tabs.
 File 04/gitpush.sh was changed and has 0 tabs.
 File 04/hub.jpg was 
 changed and has 105 tabs.
 File 04/lab.jpg was changed and has 114 tabs.
 File hotfix/we_gonna_die/project_dev.app was changed and has 0 tabs.
 Total tabs in all changed files is >> 219 tabs.
```
