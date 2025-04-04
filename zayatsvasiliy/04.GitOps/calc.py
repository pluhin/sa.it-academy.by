#!/bin/python3
import random
def main():
    b = random.randint(-1000, 10000)
    a = random.randint(-9999, 100000)

    print("RND Addition:", add(a, b))
    print("RND Subtraction:", subtract(a, b))
    print("RND Multiplication:", multiply(a, b))
    print("RND Division:", divide(a, b))

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

if __name__ == "__main__":
    main()

