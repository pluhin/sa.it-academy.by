# Github action file
```bash
name: GitOps_tabs

on: pull_request

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: pull modified files
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v34

      - name: Count tabs in changed files
        run: |
           for file in ${{ steps.changed-files.outputs.all_changed_and_modified_files }}; do
             echo "$file was changed"
             echo "Tab count in ${file} is $(grep -c $'\t' ${file})" >> report.log
           done
      - name: Upload report
        uses: actions/upload-artifact@v3
        with:
          path: report.log
```

## My Repository
https://github.com/ArtsiomBorisevich/03.git.hosting

## Jobs build
https://github.com/ArtsiomBorisevich/03.git.hosting/actions/runs/3508960975/jobs/5877737867

## Task completion report
```bash
Tab count in master_file is 1
Tab count in tabsFile is 2
```
