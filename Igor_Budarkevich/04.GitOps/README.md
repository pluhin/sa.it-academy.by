# 04.GIT.Ops

## URL Action

[GithubAction](https://github.com/igortank/MyRepository/actions/runs/4270684851)

## Script yaml

```yaml
name: Check action!

on: [push]

jobs:
  initrep:
    runs-on: [firstRunner]
    steps:
      - name: Clone repository
        uses: actions/checkout@v3

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v35

      - name: List all changed files
        run: |
          echo "List tabs:" > result.log
          count=0
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            tmp=$(/home/admin1/findTabs.py $file)
            echo "$file was changed and has $tmp tabs!" >> result.log
            count=$(($count + $tmp))
          done
          echo "Total $count tabs!" >> result.log
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: result.log

```

## Script findTabs.py

```python
#!/usr/bin/env python3

import sys

#open file in read mode
file = open(f'{sys.argv[1]}', "r")

#read the content of file
data = file.read()

#get the length of the data
number_of_characters = data.count('\t')

print(number_of_characters)
```

## Result artefact

```text
List tabs:
shot_002.jpg was changed and has 2168 tabs!
test.txt was changed and has 13 tabs!
Total 2181 tabs!
```
