# 04.GitOps

## Link on GitHub Action
[Github_action](https://github.com/OksanaDemidovec/md-sa2-23-23-github/actions/runs/4428505949)

## File .yaml of GitHub Action

```bash
name: Tab search in changed files on PR

on:
  push:
  pull_request:
  
jobs:
  find-changes:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - id: files
        uses: jitterbit/get-changed-files@v1
        name: tab search
      - run: |
          for changed_file in ${{ steps.files.outputs.all }}; do
            count=$(grep -o $'\t' $changed_file | wc -l)
            echo "Количество табуляций в файле $changed_file: $count" >> total_count.txt
            total_count=$((total_count + count))
          done
          echo "Общее количество табуляций: $total_count" >> total_count.txt
      - name: Upload artifacts
        uses: actions/upload-artifact@v3
        with:
          name: changes-info
          path: |
            total_count.txt
```
