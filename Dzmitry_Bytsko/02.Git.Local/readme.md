## -=- Initialize local repository on your test host -=-
```bash
mkdir 02_git_local
ls
cd 02_git_local/
git init
```
## - master (init branch)
```bash
echo '01_master_commit'>01_master_c_file.txt
git add 01_master_c_file.txt
git commit -m '01_master_c_file.txt'
echo '02_master_commit'>02_master_c_file.txt
git add 02_master_c_file.txt
git commit -m '02_master_c_file.txt'
```

## - dev (has been created from master)
```bash
git branch dev
echo '03_master_commit_dev_passive'>03_master_dev_pass_c_file.txt
git add 03_master_dev_pass_c_file.txt
git commit -m '03_master_dev_pass_c_file.txt'
echo '04_master_commit_dev_passive'>04_master_dev_pass_c_file.txt
git add 04_master_dev_pass_c_file.txt
git commit -m '04_master_dev_pass_c_file.txt'
git checkout dev
echo '05_commit_dev'>05_dev_c_file.txt
git add 05_dev_c_file.txt
git commit -m '05_dev_c_file.txt'
echo '06_commit_dev'>06_dev_c_file.txt
git add 06_dev_c_file.txt
git commit -m '06_dev_c_file.txt'
```

## - features/do_one (has been created from dev branch)
```bash
git branch features/do_one
git checkout master
echo '07_commit_master_f_do_one_pass'>07_master_f_do_one_pass_c_file.txt
git add 07_master_f_do_one_pass_c_file.txt 
git commit -m '07_master_f_do_one_pass_c_file.txt'
echo '08_commit_master_f_do_one_pass'>08_master_f_do_one_pass_c_file.txt
git add 08_master_f_do_one_pass_c_file.txt 
git commit -m '08_master_f_do_one_pass_c_file.txt'
git checkout dev
echo '09_commit_dev_f_do_one_pass'>09_dev_f_do_one_pass_c_file.txt
git add 09_dev_f_do_one_pass_c_file.txt 
git commit -m '09_dev_f_do_one_pass_c_file.txt'
echo '10_commit_dev_f_do_one_pass'>10_dev_f_do_one_pass_c_file.txt
git add 10_dev_f_do_one_pass_c_file.txt 
git commit -m '10_dev_f_do_one_pass_c_file.txt' 
git checkout features/do_one 
echo '11_commit_f_do_one'>11_f_do_one_c_file.txt
git add 11_f_do_one_c_file.txt 
git commit -m '11_f_do_one_c_file.txt' 
git checkout master
```

## - hotfix/we_gonna_die (has been created from master branch)
```bash
git branch hotfix/we_gonna_die
echo '12_commit_master_wgd_pass'>12_commit_master_wgd_pass.txt
git add 12_commit_master_wgd_pass.txt 
git commit -m '12_commit_master_wgd_pass.txt' 
echo '13_commit_master_wgd_pass'>13_commit_master_wgd_pass.txt
git add 13_commit_master_wgd_pass.txt 
git commit -m '13_commit_master_wgd_pass.txt' 
git checkout hotfix/we_gonna_die 
echo '14_commit_wgd'>14_commit_wgd.txt
git add 14_commit_wgd.txt 
git commit -m '14_commit_wgd.txt' 
```

## - Release phase - all commits should be inside master (except commits which is presented in branch hotfix)
```bash
git checkout dev
git merge features/do_one --no-ff
ls
git checkout
git checkout master
ls
git checkout dev
ls
git checkout master
git merge dev --no-ff
ls
git log
\it log --graph --all --oneline --decorate
git log --graph --all --oneline --decorate
```

## - Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too
```bash
git checkout master
git cherry-pick hotfix/we_gonna_die
git checkout dev
git cherry-pick hotfix/we_gonna_die
git checkout features/do_one
git cherry-pick hotfix/we_gonna_die
git log --graph --all --oneline --decorate
history | cut -c 8- >README.md
```