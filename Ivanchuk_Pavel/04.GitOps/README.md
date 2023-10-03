# 04. GitOps

## Setting up a Basic GitHub Action

### Created a new public repository on GitHub and  created inside a JavaScript script.


[->Click here <-](https://github.com/IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps "GitHub for Action")

**Command History:**
```bash
  368  mkdir /home/04.GitOps
  369  cd /home/04.GitOps
  370  mkdir ./repo
  371  cd ./repo
  372  git init
  373  git remote add origin git@github.com:IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps.git
  376  nano hello.js
  377  git add hello.js
  378  git commit -m "Add script"
  382  git push -u origin --all
  383  apt install nodejs
  385  node hello.js
  386  nano hello.js
  395  git config --global user.name "Ivanchuk Pavel"
  396  git config --global user.email "marchik32@gmail.com"
  399  git add --all
  400  git commit -m "First try pushing action"
  401  git push
```

**Script:**
```bash
console.log("Hello, GitHub Actions!");
```

### Created a new GitHub Action workflow. Configured the workflow to run the JS script.

I won’t hide how many attempts there were to create and study Github Action. 
I've done so many stupid things. But the best way to learn is through mistakes. 
At first there were problems with the YAML syntax (then I remembered how I set up the
Internet for the first time and the jokes with tabs in YAML). 
Then I couldn’t understand why the VM from Github doesn’t see the script located 
in the repository. I tried to upload the file to the workflow directory and to no avail,
until I finally looked for answers in ready-made solutions and realized that everything 
had already been done for us and we needed to specify our repository for the VM and then 
everything would work. The output of the file indicated in Artifact.
Ad aspara ad astra

**Abbreviated command history**
```bash
  391  mkdir -p .github/workflows/
  393  nano -p .github/workflows/hello.yaml
  407  nano .github/workflows/hello.yaml
  441  node /home/04.GitOps/repo/hello.js
  442  node /home/04.GitOps/repo/hello.js > console.log
  443  rm -rf console.log
  444  nano .github/workflows/hello.yaml
  524  cp hello.js .github/workflows/hello.js
  525  git add --all
  526  git commit -m "new new"
  527  git push
  540  nano .github/workflows/hello.yaml   `here finaly i made this`
  541  git add --all
  542  git commit -m "y4"
``` 


**Final version of workflow file:**
```yaml
name: Test script
on: 
  push: 
    branches:
    - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Download node for Javascript
      # I know that the runtime environment for javascript code and
      # python code is already installed on the Github VM, but for reliability, you
      # can install it so that everything works exactly on the latest version
        run: sudo apt update && sudo apt install -y nodejs 
      - run: echo "node has been installed" 
      
      - name: Get checkout repo
        uses: actions/checkout@v4
 
      - name: Start script
        run: |
          pwd
          ls -la
          chmod +x hello.js
          node hello.js > outputjs.log
          echo "Script executed successfully"
 
      - name: Upload command output
        uses: actions/upload-artifact@v2
        with:
          path: outputjs.log
```


### Observed the GitHub Action run

![Artifact](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/5b991c0d-3f9c-48b4-ae51-e26941e27e1b)

---

![Inside_action](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/edd9ded0-3296-412a-8651-f307537744a7)

---

![Work_action](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/f8a8699e-c192-4606-875f-f116ca299907)

**Here I tested whether the action would fire if I launched another file**
```bash
  543  git push
  544  touch README.md
  545  date >> README.md
  546  git add --all
  547  git commit -m "Test push action"
  548  git push
```
---

![Test_action](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/ff7e3aee-21fb-40ab-add0-e1b2065e65c0)

## Building and Testing with GitHub Actions

### Chose a programming language. Set up existing repository.

[->Click here <-](https://github.com/IPaul32/sa2-ma25-23-Ivanchuk-04.GitOps/tree/Unit-test "Unit-test branch")

I decided to perform this task in the same repository, but in a different 
`Unit-test` branch.
The programming language I chose was JavaScript.

**Command history**

```bash 
  549  git branch Unit-test
  550  git checkout Unit-test
```

### Created a simple calculator on JavaScript:
```JavaScript
// Function for adding two numbers
function add(a, b) {
   return a + b;
}

// Function to subtract two numbers
function subtract(a, b) {
   return a - b;
}

// Function to multiply two numbers
function multiply(a, b) {
   return a * b;
}

// Function to divide two numbers
function divide(a, b) {
   // Check for zero to avoid division by zero
   if (b === 0) {
     throw new Error("Division by zero is not allowed");
   }
   return a/b;
}

// Export functions for use in other modules
module.exports = {
   add,
   subtract,
   multiply,
   divide,
};
```

### Wrote unit test for program using a jest framework for JS

I used Jest as a framework for the unit test.
This is where I had difficulties, since I had never done anything like this
and wrote it incorrectly. But this was a problem at the end of the test on the
local machine. At the beginning, there was a problem with the versions of npm 
and NodeJS not matching, and I spent a lot of time resolving the inconsistencies.
But on skill now. 

**Test code:**
```Jest 
const calculator = require("./calc.js"); // Connecting a module with calculator function

// Test addition
test("should add two numbers", () => {
   expect(calculator.add(2, 3)).toBe(5); // Check that the result is 5
});

// Test subtraction
test("should subtract two numbers", () => {
   expect(calculator.subtract(5, 3)).toBe(2); // Check that the result is 2
});

// Test multiplication
test("should multiply two numbers", () => {
   expect(calculator.multiply(2, 3)).toBe(6); // Check that the result is 6
});

// Test division
test("should divide two numbers", () => {
   expect(calculator.divide(6, 3)).toBe(2); // Check that the result is 2
});

// Test for error when dividing by zero
test("should throw an error when dividing by zero", () => {
   expect(() => calculator.divide(5, 0)).toThrow("Division by zero is not allowed"); // Check that the error is raised with the correct message
});
```


**Abbreviated command history**
``` bash
  551  nano calc.js
  552  nano test-calc.json
  555  apt install npm
  565  npm install --save-dev jest
  568  nano calc-test.json
  569  npx test
  573  mv /home/04.GitOps/repo/calc-test.json /home/04.GitOps/repo/calc.test.js
  575  nano calc.test.js
  581  cat package.json
  592  node -v
  593  apt update
  594  apt upgrade
  596  sudo apt-get install -y ca-certificates curl gnupg
  597  sudo mkdir -p /etc/apt/keyrings
  598  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  599  NODE_MAJOR=18
  600  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list\n
  602  sudo apt-get update
  603  sudo apt-get install nodejs -y
  604  npm test
  605  npm install -g npm@10.1.0
  606  sudo apt-get update
  607  sudo apt-get upgrade
  634  nano calc.test.js
  635  calc.js
  636  nano calc.js
  637  npm test
```


### Created a GitHub Action workflow that runs the unit tests.

**Command history**
``` bash 
  670  nano .github/workflows/unit-test.yaml
  671  git add --all
  672  git commit -m "Last changes and done"
  673  git push
```

**Worflow:**
```yaml
name: Test script
on: 
  push: 
    branches:
    - Unit-test

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Get checkout repo
        uses: actions/checkout@v4

      # This time I decided to install a node on a GitHub VM through an action 
      # indicating a specific version
      - name: Install node from action 
        uses: actions/setup-node@v3
        with: 
          node-version: '18'

      - name: Install npm 
        run: npm install 

      - name: Run test
        run: |
             npm test
             echo "Test passed"
```

At first I tried to display the entire test result in Artifact, but only 
`> calc-test.json@1.0.0 test >jest`
was displayed, so I removed this idea. The test results are still visible 
in the action execution console:
```bash 
  652  npm test >> /tmp/test.log
  653  cat /tmp/test.log
  654  npm test >> /tmp/test.log | jest --outputFile=/tmp/test.log
  655  npm test --outputFile=/tmp/test.log
  656  cat /tmp/test.log
  657  npm test --outputFile=test.log
  658  nano .github/workflows/unit-test.yaml
  659  git add --all
  660  git commit -m "Attempt results in artifact"
  661  git push
  662  npm test jest --outputFile=test.log
  663  npm test --outputFile=test.log
  664  npm test --outputFile=test.json
  665  npm test --outputFile=test-results.json
  666  nano .github/workflows/unit-test.yaml
  667  git add --all
  668  git commit -m "Delete artifact"
  669  git push
```

### Checkout the workflow reports

---
![Unit_test_passed](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/dbf76f62-4eea-4c9e-b004-c271cd0c915a)

---

![Unit-test-done](https://github.com/IPaul32/sa2-25-23-Ivanchuk/assets/145698867/cff82b49-e562-43bb-9a84-1b168fedaa85)
