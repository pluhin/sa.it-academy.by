    1  git init
    2  git config user.name "Nikita Pastukhov"
    3  git config user.email "n.pastukhov@velcom.by"
    4  git status
    5  touch file.txt
    6  vim file.txt
    7  git add . file.txt
    8  git add .
    9  git commit -m "first commit"
    10  vim file.txt
    11  git add .
    12  git commit -m "second commit"
    13  git checkout -b dev
    14  ll
    15  touch file2.txt
    16  vim file2.txt
    17  git add .
    18  vim file2.txt
    19  git commit -m "third commit"
    20  vim file2.txt
    21  git commit -m "fourth commit"
    22  git add .
    23  git checkout -b features/do_one
    24  git branch
    25  ll
    26  touch file3.txt
    27  vim file3.txt
    28  git add .
    29  git commit -m "fifth commit"
    30  git checkout master
    31  ll
    32  git checkout -b hotfix/we_gonna_die
    33  ll
    34  touch file4.txt
    35  vi file4.txt
    36  git add .
    37  git commit -m "sixth commit"
    38  git checkout master
    39  git merge dev
    40  git merge features/do_one
    41  git merge hotfix/we_gonna_die
    42  ll
    43  git checkout dev
    44  git merge hotfix/we_gonna_die
    45  git checkout features/do_one
    46  git merge hotfix/we_gonna_di
    47  ll
    48  git checkout dev
    49  ll
    50  history
