# 04. GitOps

## Homework Assignment 3: Continuous Deployment with GitHub Actions (Optional)

1. Choose a static website or a simple web application project.

[https://mazurovsasha.github.io/04.GitOps.Option/index.html]

2. Create a GitHub repository for your project.

```bash
git init

git status

git ac "first commit"

git remote add origin git@github.com:Mazurovsasha/04.GitOps.Option.git

git push -u origin master

git branch gh-pages

git switch gh-pages
```

[https://github.com/Mazurovsasha/04.GitOps.Option]

3. Set up a basic HTML/CSS or the appropriate project structure.

index.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>Добро пожаловать на мой сайт</title>
</head>
<body>
    <h1>Приветствую на моем сайте!</h1>
    <p>Это демонстрационный статический веб-сайт для GitHub Pages.</p>
    <a href="about.html">О нас</a>
    <a href="contact.html">Контакты</a>
</body>
</html>
```

about.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>О нас</title>
</head>
<body>
    <h1>О нашем сайте</h1>
    <p>Мы создаем простые статические веб-сайты для демонстрации функционала.</p>
    <a href="index.html">На главную</a>
    <a href="contact.html">Контакты</a>
</body>
</html>
```

contact.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>Контакты</title>
</head>
<body>
    <h1>Наши контактные данные</h1>
    <p>Вы можете связаться с нами по следующим контактам: mazurovsasha@gmail.com</p>
    <a href="index.html">На главную</a>
    <a href="about.html">О нас</a>
</body>
</html>
```

4. Create a GitHub Action workflow that automatically builds and deploys the project to GitHub Pages or another hosting service of your choice.

```bash
mkdir -p .github/workflows/

nano .github/workflows/main.yml
```

main.yml

```yml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Build and Deploy
        run: |
          mkdir public
          cp *.html public/
          echo 'Hello from GitHub Actions' > public/index.html

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

5. Push changes to your repository and verify that the website or application is automatically deployed.

```bash
git ac "My commit"

git push -u origin gh-pages
```