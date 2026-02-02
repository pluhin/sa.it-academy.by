import random
import string

def generate_password(length):
    if length < 1:
        raise ValueError("length must be at least 1")
    if length > 100:
        raise ValueError("length must be no more than 100")

    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choices(characters, k=length))
    return password

if __name__ == "__main__":
    length = int(input("enter the number of characters: "))

    try:
        password = generate_password(length)
        print("a password has been generated:")
        print(password)
    except ValueError as e:
        print(e)