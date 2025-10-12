
import subprocess

import sys

def run_git_command(cmd, cwd=None):
    try:
        result = subprocess.run(cmd,
                              shell=True,
                              capture_output=True,
                              text=True,
                              cwd=cwd,
                              timeout=300)
        return result.returncode, result.stdout, result.stderr
    except subprocess.TimeoutExpired:
        return -1, "", "Таймаут выполнения команды"
    except Exception as e:
        return -1, "", str(e)

def get_remotes():
    try:
        returncode, stdout, stderr = run_git_command("git remote")
        if returncode != 0:
            print(f"Ошибка при получении remote: {stderr}")
            return []

        remotes = [remote.strip() for remote in stdout.split('\n') if remote.strip()]
        return remotes
    except Exception as e:
        print(f"Ошибка: {e}")
        return []

def git_push_to_remote(remote_name):
    print(f"🔄 Выполняю push в {remote_name}...")

    returncode, stdout, stderr = run_git_command(f"git push {remote_name}")

    if returncode == 0:
        print(f"✅ Успешно выполнен push в {remote_name}")
        if stdout.strip():
            print(f"   Вывод: {stdout.strip()}")
        return True
    else:
        print(f"❌ Ошибка при push в {remote_name}:")
        if stderr.strip():
            print(f"   Ошибка: {stderr.strip()}")
        if stdout.strip():
            print(f"   Вывод: {stdout.strip()}")
        return False

def git_push_all_remotes():
    print("🔍 Получаю список удаленных репозиториев...")

    remotes = get_remotes()

    if not remotes:
        print("❌ Не найдено ни одного удаленного репозитория")
        print("   Убедитесь, что вы в git репозитории и есть подключенные remote")
        return False

    print(f"📋 Найдено удаленных репозиториев: {len(remotes)}")
    for i, remote in enumerate(remotes, 1):
        print(f"   {i}. {remote}")

    print("\n🚀 Начинаю выполнение push во все репозитории...")

    success_count = 0
    failed_count = 0
    failed_remotes = []

    for remote in remotes:
        success = git_push_to_remote(remote)
        if success:
            success_count += 1
        else:
            failed_count += 1
            failed_remotes.append(remote)
        print()

    print("=" * 50)
    print("📊 ИТОГИ:")
    print(f"✅ Успешно: {success_count}")
    print(f"❌ Ошибки: {failed_count}")
    print(f"📋 Всего обработано: {len(remotes)}")

    if failed_remotes:
        print(f"📛 Репозитории с ошибками: {', '.join(failed_remotes)}")

    return failed_count == 0

def main():
    print("🐍 Git Push All Remotes - Упрощенная версия")
    print("=" * 50)

    returncode, _, stderr = run_git_command("git rev-parse --is-inside-work-tree")
    if returncode != 0:
        print("❌ Ошибка: текущая директория не является git репозиторием")
        print(f"   Детали: {stderr}")
        sys.exit(1)

    returncode, current_branch, _ = run_git_command("git branch --show-current")
    if returncode == 0:
        print(f"🌿 Текущая ветка: {current_branch.strip()}")
    else:
        print("🌿 Текущая ветка: неизвестна")

    print()

    success = git_push_all_remotes()

    if success:
        print("\n🎉 Все push выполнены успешно!")
        sys.exit(0)
    else:
        print("\n💥 Были ошибки при выполнении push")
        sys.exit(1)

if __name__ == "__main__":
    main()

