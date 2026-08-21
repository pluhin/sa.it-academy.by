from string_utils import reverse_string, is_palindrome

def test_reverse_string():
    assert reverse_string("hello") == "olleh"
    assert reverse_string("") == ""

def test_is_palindrome():
    assert is_palindrome("шалаш") is True
    assert is_palindrome("Radar") is True

def test_is_not_palindrome():
    assert is_palindrome("github") is False