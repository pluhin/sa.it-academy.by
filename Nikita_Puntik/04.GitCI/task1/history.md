```bash
   39  git clone git@github.com:puntiknikita1-netizen/github-actions-hw.git
   40  cd github-actions-hw/
   41  pwd
   42  ls -la
   43  cat > hello.py << 'EOF'
#!/usr/bin/env python3
print ("Hello , GIT !")
EOF

   44  cat hello.py
   45  chmod +x hello.py
   46  python3 hello.py
   47  mkdir -p .github/workflows
   48  cat > .github/workflows/hello.yaml
   49  ls
   50  nano .github/workflows/hello.yaml
   51  ls
   52  ls -help
   53  ls help
   54  ls --help
   55  ls -a
   56  nano .github/workflows/hello.yaml
   57  cat .github/workflows/hello.yaml
   58  git add .
   59  git status
   60  git commit -m "Add Hello.py"
   61  git push origin main
   62  git status
   63  nano .github/workflows/hello.yaml
   64  git add .
   65  git commit -m "Add Hello.py -v2"
   66  git status
   67  git push origin main
   68  git pull origin main
   69  cat .github/workflows/hello.yaml
   70  ls
   71  date >> README.md
   72  git status
   73  git add --all
   74  git commit -m "Test"
   75  git push origin main
```
