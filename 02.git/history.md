 500  git clone https://github.com/Vchizhik/sa.it-academy.by.git
  501  cd /e/workbox/sa.it-academy.by/
  502  git init
  503  mkdir vchizhik
  504  cd /e/workbox/sa.it-academy.by/vchizhik/
  505  git init
  506  touch m_1.txt
  507  git add m_1.txt
  508  git commit -m "m_1"
  509  touch m_2.txt
  510  git add m_2.txt
  511  git commit -m "m_2"
  512  git checkout -b dev
  513  touch d_1.txt
  514  git add d_2.txt
  515  git add d_1.txt
  516  git commit -m "d_1"
  517  touch d_2.txt
  518  git add d_2.txt
  519  git commit -m "d_2"
  520  git checkout -b features/do_one
  521  touch f_1.txt
  522  git add f_1.txt
  523  git commit -m "f_1"
  524  git checkout master
  525  git checkout -b hotfix/we_gonna_die
  526  touch h_1.txt
  527  git add h_1.txt
  528  git commit -m "h_1"
  529  git log --oneline
  530  history
  531  git checkout master
  532  git merge dev
  533  git merge features/do_one
  534  git merge hotfix/we_gonna_die
  535  git log --oneline
  536  git checkout dev
  537  git merge hotfix/we_gonna_die
  538  git checkout fearures/do_one
  539* git checkout features/do_on
  540  git merge hotfix/we_gonna_die
  541  git log --oneline
  542  git checkout master
  543  git status
  544  git log --oneline
  545  history
  
  ---
  
  8d817db m_11542b7e (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
08d4d3a (hotfix/we_gonna_die) h_1
ee08b53 (features/do_one) f_1
90dd48a (dev) d_2
3922020 d_1
0d061d6 m_2
8d817db m_1

---
$ git log --oneline
81857d8 (HEAD -> features/do_one) Merge branch 'hotfix/we_gonna_die' into features/do_one
08d4d3a (hotfix/we_gonna_die) h_1
ee08b53 f_1
90dd48a d_2
3922020 d_1
0d061d6 m_2
8d817db m_1

---
$ git log --oneline
1542b7e (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
08d4d3a (hotfix/we_gonna_die) h_1
ee08b53 f_1
90dd48a d_2
3922020 d_1
0d061d6 m_2
8d817db m_1
