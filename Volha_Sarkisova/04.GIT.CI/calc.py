"""Simple calculator with basic operations and string manipulation."""

class Calculator:
    """A simple calculator class."""
    
    def add(self, a: float, b: float) -> float:
        """Return sum of two numbers."""
        return a + b
    
    def subtract(self, a: float, b: float) -> float:
        """Return difference of two numbers."""
        return a - b
    
    def multiply(self, a: float, b: float) -> float:
        """Return product of two numbers."""
        return a * b
    
    def divide(self, a: float, b: float) -> float:
        """Return quotient of two numbers.
        
        Raises:
            ValueError: When dividing by zero.
        """
        if b == 0:
            raise ValueError("Cannot divide by zero!")
        return a / b
    
    def power(self, a: float, b: float) -> float:
        """Return a raised to power b."""
        return a ** b
    
    def modulo(self, a: float, b: float) -> float:
        """Return remainder of division."""
        if b == 0:
            raise ValueError("Cannot modulo by zero!")
        return a % b


def reverse_string(text: str) -> str:
    """Return reversed string."""
    return text[::-1]


def count_vowels(text: str) -> int:
    """Return number of vowels in string."""
    vowels = 'aeiouAEIOUаеёиоуыэюяАЕЁИОУЫЭЮЯ'
    return sum(1 for char in text if char in vowels)


def is_palindrome(text: str) -> bool:
    """Check if string is a palindrome."""
    cleaned = ''.join(c.lower() for c in text if c.isalnum())
    return cleaned == cleaned[::-1]
