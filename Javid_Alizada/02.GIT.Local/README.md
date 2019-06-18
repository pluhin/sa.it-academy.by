1. **mkdir 02.GIT.Local**
2. **cd 02.GIT.Local/**
3. **git init
4. **git config --global user.name "Javid Alizada"
5. **git config --global user.email "javid.alizade@hotmail.com"
6. **echo "First Line in first file in Master Branch" > master_first_file01
7. **git add  master_first_file01
8. **git commit -m "first commit for master branch"
9. **echo "simple line for commit" > file_for_second_commit
10. **git add  file_for_second_commit
11. **git commit -m "Second Commit for Git lab"
12. **git log --oneline
13. **git checkout -b "dev"
14. **echo "My Forst Line indi Dev Branch" > dev_branch_basic_commit
15. **git add dev_branch_basic_commit
16. **git commit -m "first commit in dev branch"
17. **echo "Second line in dev branch second file" > dev_branch_basic_commit02
18. **git add  dev_branch_basic_commit02
19. **git commit -m "Second Commit in Dev branch"
20. **git log --oneline
21. **git checkout -b "features/do_one"
22. **echo "My First Line in features/do_one branch file" > feat_do_one_file01
23. **git add  feat_do_one_file01
24. **git commit -m "first commit for features/do_one branch"
25. **git checkout master
26. **git status
27. **git log --oneline
28. **git checkout -b "hotfix/we_gonna_die"
29. **echo "Line in we_gonna_die branch" > we_gonna_die_file01
30. **git add we_gonna_die_file01
31. **git commit -m "commit in we_gonna_die branch"
32. **git log --oneline
33. **git branch
34. **git checkout master
35. **git merge dev
36. **git merge features/do_one
37. **git merge hotfix/we_gonna_die
