# GitOps
## Links
### GitHub repository
[https://github.com/Tony-BY/03-Git.git](https://github.com/Tony-BY/03-Git.git)
### Actions log
[https://github.com/Tony-BY/03-Git/runs/7703990814?check_suite_focus=true](https://github.com/Tony-BY/03-Git/runs/7703990814?check_suite_focus=true)
### Artifacts
[https://github.com/Tony-BY/03-Git/suites/7694599914/artifacts/321529886](https://github.com/Tony-BY/03-Git/suites/7694599914/artifacts/321529886)
## Action file
### Link
[first.yaml](first.yaml)

#### first.yaml
```yaml
name: Count tabs in code

on:
  pull_request:
     branches:
       - master

jobs:
  build:
    runs-on: ubuntu-latest
    name: Count tabs in changed files
    steps:
      - run: echo "The ${{ github.repository }} repository will be cloned to the runner"
      - uses: actions/checkout@v3

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v24

      - name: Count tabs in changed files
        run: |
           for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
             echo "Tab counter in ${file} is $(grep -c \t ${file})" >> tabs_in_code.log
           done

      - name: Upload report
        uses: actions/upload-artifact@v2     
        with:
          path: tabs_in_code.log    
```