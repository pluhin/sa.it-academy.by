# Простой калькулятор

def add(a, b):
    """Сложение"""
    return a + b

def subtract(a, b):
    """Вычитание"""
    return a - b

def multiply(a, b):
    """Умножение"""
    return a * b

def divide(a, b):
    """Деление"""
    if b == 0:
        raise ValueError("Ошибка: деление на ноль!")
    return a / b

def calculate(num1, num2, operator):
    """Основная функция калькулятора"""
    if operator == "+":
        return add(num1, num2)
    elif operator == "-":
        return subtract(num1, num2)
    elif operator == "*":
        return multiply(num1, num2)
    elif operator == "/":
        return divide(num1, num2)
    else:
        raise ValueError("Неверный оператор! Используйте: +, -, *, /")

def main():
    """Интерактивный режим"""
    print("Простейший калькулятор")
    print("Доступные операции: +, -, *, /")
    
    try:
        num1 = float(input("Введите первое число: "))
        operator = input("Введите оператор (+, -, *, /): ")
        num2 = float(input("Введите второе число: "))
        
        result = calculate(num1, num2, operator)
        print(f"{num1} {operator} {num2} = {result}")
    
    except ValueError as e:
        print(f"Ошибка: {e}")
    except Exception as e:
        print(f"Произошла ошибка: {e}")

if __name__ == "__main__":
    main()