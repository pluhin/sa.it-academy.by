# 04.GitOps

## Link's

[Repo - sgoser/Git.Local](https://github.com/sgoser/Git.Local)

[Git Action Run - URL](https://github.com/sgoser/Git.Local/actions/runs/3516609021)

## Step 1. YAML workflow

```bash
256  mkdir -p .github/workflows
257  vim .github/workflows/tabs_counter.yaml
```

### tabs_counter.yaml

```yaml
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

## Step 2. Creating files with tabs

### 4_tabs_file

```text
	<'1st tab'.	<'2nd tab'.
'3th tab'>	.
'4th tab'>	.
'8 spaces'        .
line to change >   <
```

### 6_tabs_file

```text
	<'1st tab'.	<'2nd tab'.
'3th tab'>	.
'4th tab'>	.
	<'5th tab'.
	<'6th tab'.
        <'8 spaces'.
line to change >   <
```

## Step 3. PR

### Push new commit in dev branch

```bash
git checkout dev
git add --all
git commit -m "Git Action. Add file with tabs."
git push origin_github
```

And PR from dev branch to master in web interface.

## Step 4. Check Result.log in artifacts

report.log file contents from Git Action artifacts:

### report.log

```text
File .github/workflows/tabs_counter.yaml was changed and has 0 tabs.
File 4_tabs_file was changed and has 4 tabs.
File 6_tabs_file was changed and has 6 tabs.
File dev.module3.py was changed and has 0 tabs.
Total tabs in all changed file is >> 10 tabs.
```
