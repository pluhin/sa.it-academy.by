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
