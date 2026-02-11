import subprocess

remotes = subprocess.check_output(['git', 'remote']).decode().split()
branch = subprocess.check_output(['git', 'branch', '--show-current']).decode().strip()

for r in remotes:
    print(f"Pushing to {r}...")
    subprocess.run(['git', 'push', r, branch])
