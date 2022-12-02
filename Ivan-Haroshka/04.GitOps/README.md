### File yaml
```yaml
name: GitOps

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
### My Repository
https://github.com/Haroshka/github-ci

### Build
https://github.com/Haroshka/github-ci/actions/runs/3592851522/jobs/6049062948

### Completion report

Tab count in 2.txt is 0
Tab count in 3.txt is 0
