## Github action file
```bash
name: find_tabs

on: [ pull_request ]

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
        uses: tj-actions/changed-files@v24

      - name: Count tabs in changed files
        run: |
           for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
             echo "Tab counter in ${file} is $(grep -c \t ${file})" >> report_tabs.log
           done

      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: report_tabs.log
```

## My Repository
https://github.com/Luchik51/homework

## Link status action
https://github.com/Luchik51/homework/runs/8207857790?check_suite_focus=true 

## Task completion report
```bash
Tab counter in .github/workflows/first.yaml is 16
Tab counter in .github/workflows/testfile.txt is 14
```