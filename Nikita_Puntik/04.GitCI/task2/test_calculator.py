import sys
import os

# Добавляем родительскую папку в путь, чтобы импортировать calculator
sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

from calculator import add, subtract, multiply, divide

def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0

def test_subtract():
    assert subtract(10, 4) == 6
    assert subtract(0, 5) == -5

def test_multiply():
    assert multiply(5, 6) == 30
    assert multiply(-2, 3) == -6
    assert multiply(0, 100) == 0

def test_divide():
    assert divide(15, 3) == 5
    assert divide(7, 2) == 3.5
    assert divide(-10, 2) == -5

def test_divide_by_zero():
    try:
        divide(10, 0)
    except ValueError as e:
        assert str(e) == "Cannot divide by zero!"
    else:
        # Если исключение не было поднято, тест провален
        assert False, "Expected ValueError but no exception was raised"
