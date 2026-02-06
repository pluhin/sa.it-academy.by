# 04.GitOps

https://github.com/ztsv-alexey/04.GitOps

```bash
cd ~/alekson/04.GitOps/
nano hello.py
python hello.py
mkdir -p .github/workflows
nano .github/workflows/hello.yml
git add .
git commit -m "add script hello.py and action hello.yml"
git push origin main
nano password_generator.py
python password_generator.py
nano test_generator.py
nano requirements.txt
sudo apt install python3-pytest
python3 -m pytest -v
nano .github/workflows/test.yml
git add .
git commit -m "add password generator with tests"
git push origin main
```
