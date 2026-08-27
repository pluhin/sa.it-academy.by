# History


## №1
```
516 cd Documents/
517 ls -a
518  mkdir DevOps_learning
519  cd DevOps_learning/
520  git clone https://github.com/aionfiend/sa.it-academy.by.git
526  cd sa.it-academy.by/
527  git checkout md-sa2-36-26
528  mkdir Aleksandr_Radvansky
529  cd Aleksandr_Radvansky/
530  mkdir 02.Git.Local
531  touch README.md
532  git status
533  git add README.md
534  git commit -m "Start homework - step №1"
535  cd ..
536.  ls -a
537  cd ..
538  ls -a
539  echo Text.rtf > sa.it-academy.by/Aleksandr_Radvansky/README.md
540  cat Text.rtf > sa.it-academy.by/Aleksandr_Radvansky/README.md
541  cd sa.it-academy.by/Aleksandr_Radvansky/
542  cat README.md
```

## №2
```
543  git branch -c feature-branch
544  git status
546  git branch --show-current
547  git branch -b feature-branch
549  git checkout feature-branch
550  git branch --show-current
551  ls -a
552  cd 02.Git.Local/
553  ls -a
554  cd ..
555  nano README.md
556  git checkout
557  git branch --show-current
558  git merge feature-branch
559  git commit -m "Branch and merge - step №2"
561  git add --all
562  git status
563  git log
565  git log --oneline
566  git checkout feature-branch
567  nano README.md
568  git commit -m "Branch rebuild - step №2"
569  git checkout -
570  git merge feature-branch
```

## №3-4
```
571  git log
572  git show 4e05bb0db01de213c3bce8327258842364635c44
573  git show 122d3ed0576277bc8ae0a879e9a422b1ea3ec897
574  git commit -m "Log and hash - step №3"
575  git status
576  git checkout md-sa2-36-26
577  cat README.md
578  git merge feature-branch
579  cat README.md
580  git commit -m "Step №4" $$ git
581  git log
582  git log --oneline
583  git tag -a Step1 7d5f9ddb -m "Start work"
584  git tag -a Step1 7d5f9ddb -m "v1.0"
585  git tag  "v1.0" "Start work"
586  git tag
587  git tag  "v1.0" "Step1"
588  git tag
589  git tag -d "Step1"
590  git tag
591  nano README.md
592  git log --oneline
593  git commit -m "Step №4" $$ git log --oneline
594  git log --oneline
595  git commit -m "Step №4"
596  git log --oneline
599  git add -all && git commit -m "Step №4"
600  git commit -m "Step №4"
601  cd ../..
602  ls -a
603  cat Textcopy.rtf > sa.it-academy.by/Aleksandr_Radvansky/README.md
604  cd sa.it-academy.by/Aleksandr_Radvansky/
605  ls -a
606  cat README.md
607  git add -all && git commit -m "Step №4" && git tag -a "v2.0" "Step4"
608  git commit -m "Step №4" && git tag -a "v2.0" "Step4"
609  git log
610  git log -oneline
611  git log --oneline
612  git tag -a "v2.0" "Step4"
613  git tag
614  git tag -a v2.0 -m  "Step4"
615  git tag
616  git tag -n
617  git show v1.0 --stat
```

## №5
```
618  git branch -c bug-fix
619  git checkout bug-fix
620  cd ../..
621  cat Text.rtf > sa.it-academy.by/Aleksandr_Radvansky/README.md
622  cd sa.it-academy.by/Aleksandr_Radvansky/
623  git commit -m "Step №5 before"
625  git log --oneline
626  git log
627  git tag -a v1.0 -m  "Step5"
628  git tag -a v3.0 -m  "Step5"
629  nano README.md
630  git commit -m "Step №5 after"
631  git add README.md
632  git commit -m "Step №5 after"
633  nano README.md
634  git add README.md
635  git commit -m "Step №5 afterv.2"
636  git log --oneline
639  git reset --soft
640  87ee8db3 Project changescat README.md
641  cat README.md
642  git log --oneline
643  git reset --soft 01f53d54
644  git log --oneline
645  git reset --soft e8769635
646  git log --oneline
647  cat README.md
648  git commit -m "Step №5 afterv.2"
649  git log --oneline
650  git reset --mixed e8769635
651  cat README.md
652  git log --oneline
653  git add README.md
654  git commit -m "Step №5 afterv.2"
655  git reset --hard e8769635
656  git log --oneline
657  cat README.md
658  git commit -m "Step №5 afterv.2"
659  git add README.md
660  git commit -m "Step №5 afterv.2"
661  nano README.md
662  git add README.md
663  git checkout -
664  nano README.md
665  git add README.md
666  git commit -m "Step №5 afterv.3"
667  git checkout md-sa2-36-26
```

## №6
```
668  git branch -c experimental-feature
669  git checkout experimental-feature
670  nano README.md
671  git stash -u
672  git stash -list
673  git stash list
674  cat README.md
675  git checkout -
676  nano README.md
677  git add README.md
678  git stash apply
679  cat README.md
680  git commit -m "Check step №6"
```

## №7
```
681  git cinfig --global user.name "Aleksandr.Radvanski"
682  git config --global user.name "Aleksandr.Radvanski"
683  git config --global user.email "aion.fiend@gmail.com"
684  git config --global alias.lg "log --oneline"
685  git config
686  git config --list
687  git config --global --list
688  git config alias.lg
689  git config --list --show-origin
690  git add README.md
691  git commit -m "Done step  №7"
```
