##CREATING BRANCHES

1) Added file Andrew.txt in master. Made the *first commit*. Added text in file: Andrew is a good guy. Made the second commit.

2) Created *second branch* based on Master. 
Modified text to:
Andrew is NOT a good guy.
Made the first commit to dev.

Modified text to "Andrew is NOT a good guy, but he is from BELARUS."

3) Created branch *"features/do_one"* containing both commits from Master and both commits from Dev.

Modified text to:
Andrew is NOT a good guy, but he is from BELARUS.
BELARUS is great.

Made commit to *"features/do_one"*.

4) Created branch *"hotfix/we_gonna_die"* containing both commits from Master.

Modified text to:
Andrew is a good guy. Andrew is from BELARUS.

Made commit to *"hotfix/we_gonna_die"* 

##RELEASE PHASE

1) Merged *dev* and *features/do_one* in *Master*.

Now the text is as following:
Andrew is NOT a good guy, but he is from BELARUS.
BELARUS is great.

2) Checked out *"hotfix/we_gonna_die"* 
Found hash of the commit (a7a1ab2)

Tried to cherry pick this commit to Master. 

Solved conflict. Commited to *Master*.

New text in *Master* after hotfix: Andrew is a good guy. Andrew is from BELARUS. BELARUS is great.
