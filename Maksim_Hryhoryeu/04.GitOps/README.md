### Repository
[Repository](https://github.com/mhryhoryeu/git-hosting)

### Github action configuration file
[Github action configuration file](https://github.com/mhryhoryeu/git-hosting/blob/master/.github/workflows/build.yaml)
```yaml
name: Check count of tabs

on:
  pull_request:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v34

      - name: Save changed files in logfile
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            echo "$file"
            echo "File $file have `grep '\t' $file | wc -l` tabs." >> files_report.log 2>&1
          done
      - name: Upload report
        uses: actions/upload-artifact@v3
        with:
          path: files_report.log
```

### Build
[Build](https://github.com/mhryhoryeu/git-hosting/actions/runs/3588832617/jobs/6040635024)

### Result
```
File Main.java have 14 tabs.
File push_script.sh have 4 tabs.
File text.txt have 2 tabs.
```
