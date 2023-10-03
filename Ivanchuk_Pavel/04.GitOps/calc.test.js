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
