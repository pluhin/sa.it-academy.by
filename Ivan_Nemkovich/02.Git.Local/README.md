## GitLocal
```bash
   48  mkdir 02.GitLocal
   49  cd 02.GitLocal/
   50  git init 
   51  git config user.name "Ivan Nemkovich"
   52  git config user.email "inemkovich@gmail.com"
   53  echo "some text" > file_master01.txt
   54  cat file_master01.txt 
   55  git status 
   56  git add file_master01.txt 
   57  git status 
   58  git commit -m "1st commit to master branch"
   59  ls -l > file_master02.txt
   60  cat file_master02.txt 
   61  git add file_master02.txt 
   62  git commit -m "2nd commit to master branch"
   63  git status 
   64  git log --oneline
   65  git checkout -b dev
   66  date > file_dev01.txt
   67  git status 
   68  git add --all
   69  git status 
   70  git commit -m "1st commit to dev branch"
   71  git log --online > file_dev02.txt
   72  git log --oneline > file_dev02.txt
   73  cat file_dev02.txt 
   74  git add file_dev02.txt 
   75  git commit -m "2nd commit to dev branch"
   76  git checkout -b features/do_one
   77  git log --oneline
   78  echo "Hi there!" > file_features01.txt
   79  git add file_features01.txt 
   80  git commit -m "1st commit to features/do_one branch"
   81  git log --oneline
   82  git checkout master 
   83  git log --oneline
   84  git checkout -b hotfix/we_gonna_die
   85  ps > file_hotfix01.txt
   86  cat file_hotfix01.txt 
   87  git add file_hotfix01.txt 
   88  git commit -m "1st commit to hotfix/we_gonna_die branch"
   89  git log --oneline
   90  git checkout master 
   91  ls -l
   92  git branch
   93  git merge features/do_one 
   94  git log --oneline
   95  ls -l
   96  git branch
   97  git cherry-pick 8e2018b
   98  git log --oneline
   99  git checkout dev
  100  git log --oneline
  101  git cherry-pick 8e2018b
  102  git log --oneline
  103  git checkout features/do_one 
  104  git log --oneline
  105  git cherry-pick 8e2018b
  106  history > ../02.Gitlocal.txt
```

## master branch
```git
2205749 (HEAD -> master) 1st commit to hotfix/we_gonna_die branch
47cbbca 1st commit to features/do_one branch
3d054c0 2nd commit to dev branch
d9da419 1st commit to dev branch
d8af4dd 2nd commit to master branch
920f090 1st commit to master branch
```

## dev branch
```git
bc18f35 (HEAD -> dev) 1st commit to hotfix/we_gonna_die branch
3d054c0 2nd commit to dev branch
d9da419 1st commit to dev branch
d8af4dd 2nd commit to master branch
920f090 1st commit to master branch
```

## features/do_one branch
```git
328e2c6 (HEAD -> features/do_one) 1st commit to hotfix/we_gonna_die branch
47cbbca 1st commit to features/do_one branch
3d054c0 2nd commit to dev branch
d9da419 1st commit to dev branch
d8af4dd 2nd commit to master branch
920f090 1st commit to master branch
```

## hotfix/we_gonna_die branch
```git
e2018b (HEAD -> hotfix/we_gonna_die) 1st commit to hotfix/we_gonna_die branch
d8af4dd 2nd commit to master branch
920f090 1st commit to master branch
```