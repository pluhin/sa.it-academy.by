def sum(a: float, b: float) -> float:
    return a + b

def div(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero!")
    return a / b
