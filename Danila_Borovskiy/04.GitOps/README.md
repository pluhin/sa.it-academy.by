## 04.GitOps

---

[GitHub Repository for steps 1-2](https://github.com/dborovskiy00/04.GitOps)

### 1. Setting up a Basic GitHub Action

`hello.js`

```javascript
const sayHello = () => {
  console.log('Hello');
}

sayHello();
```

`hello.yaml`

```yaml
name: Hello Action

on:
  push:
    branches:
      - main

jobs:
  say-hello:
    runs-on: ubuntu-latest

    steps:
      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '18.18.0'

      - name: Checkout code
        uses: actions/checkout@v2

      - name: Run script
        run: node hello.js
```

---

### 2. Building and Testing with GitHub Actions

`isPalindrome.js`

```javascript
export const isPalindrome = (str) => {
  let leftCursor = 0;
  let rightCursor = str.length - 1;

  while (leftCursor < rightCursor) {
    if (str[leftCursor] !== str[rightCursor]) {
      return false;
    }

    leftCursor++;
    rightCursor--;
  }

  return true;
}
```

`isPalindrome.test.js`

```javascript
import { isPalindrome } from './isPalindrome';

test('Should return false for "abbc"', () => {
  expect(isPalindrome("abbc")).toBe(false);
});

test('Should return true for "abba"', () => {
  expect(isPalindrome("abba")).toBe(true);
});
```

`package.json`
```json
{
  "name": "04.gitops",
  "version": "1.0.0",
  "description": "04.GitOps",
  "main": "index.js",
  "scripts": {
    "test": "jest",
    "test:save": "jest --json | jq '.' > test-results.json"
  },
  "author": "Borovskiy Danila",
  "devDependencies": {
    "@babel/core": "^7.23.9",
    "@babel/preset-env": "^7.23.9",
    "babel-jest": "^29.7.0",
    "jest": "^29.7.0"
  }
}
```

`tests.yaml`

```yaml
name: Run Tests

on: [push]

jobs:
  run-tests:
    runs-on: ubuntu-latest

    steps:
      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '18.18.0'

      - name: Checkout code
        uses: actions/checkout@v2

      - name: Install dependencies
        run: npm install && sudo apt-get update && sudo apt-get install -y jq

      - name: Run Tests
        run: npm run test:save

      - name: Upload test results
        uses: actions/upload-artifact@v2
        with:
          name: test-results
          path: test-results.json
```



