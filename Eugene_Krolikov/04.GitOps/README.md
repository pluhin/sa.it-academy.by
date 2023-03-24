# 04.GIT.Ops

## URL Action

[GithubAction](https://github.com/evkenny/DevOpsCourse/actions/runs/4508554820)

## Script yaml

```yaml
name: 04action

on: [push]

jobs:
  initrep:
    runs-on: ubuntu-latest
    steps:
      - name: Clone repos
        uses: actions/checkout@v3

      - name: Get modified files
        id: changed-files
        uses: tj-actions/changed-files@v35

      - name: List all changed files
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            echo "$file"
            echo "File $file contents `grep '\t' $file | wc -l` tabs." >> files_tab_count.log 2>&1
          done
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: files_tab_count.log

```

## Result artefact

```text
File .github/workflows/04action.yaml contents 14 tabs.
```
