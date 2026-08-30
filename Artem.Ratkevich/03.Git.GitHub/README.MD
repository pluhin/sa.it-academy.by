# 03. GIT. GitHub

Original repository: [Rollwar->C--Hello-World](https://github.com/Rollwar/C--Hello-World).

## Homework Assignment 1: Setting up a Basic GitHub Action

.github/workflows/hello.yml
```yaml
name: .NET CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  workflow_dispatch:

jobs:
  build-and-run:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup .NET SDK
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '10.0.x'

      - name: Restore dependencies
        run: dotnet restore "C#Hello World.csproj"

      - name: Build
        run: dotnet build "C#Hello World.csproj" --no-restore --configuration Release

      - name: Run application and capture output
        run: |
          dotnet run --project "C#Hello World.csproj" --no-build --configuration Release | tee console-output.txt

      - name: Show Console.WriteLine output in job summary
        run: |
          echo "### Console output" >> "$GITHUB_STEP_SUMMARY"
          echo '```' >> "$GITHUB_STEP_SUMMARY"
          cat console-output.txt >> "$GITHUB_STEP_SUMMARY"
          echo '```' >> "$GITHUB_STEP_SUMMARY"
```
## Homework Assignment 2: Building and Testing with GitHub Actions
Original repository: [Rollwar->C--Hello-World](https://github.com/Rollwar/C--SimpleCalc).
```yaml
name: CI

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup .NET
        uses: actions/setup-dotnet@v4
        with:
          dotnet-version: '10.0.x'

      - name: Restore dependencies
        run: dotnet restore

      - name: Build
        run: dotnet build --no-restore --configuration Release

      - name: Test
        run: dotnet test --no-build --configuration Release --verbosity normal
```
