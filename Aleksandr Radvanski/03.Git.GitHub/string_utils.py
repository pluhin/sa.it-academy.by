def reverse_string(text):
    return text[::-1]

def is_palindrome(text):
    clean_text = text.replace(" ", " ").lower()
    return clean_text == clean_text[::-1]