import pytest
from password_generator import generate_password


def test_password_length():
    """matching the password length"""
    password = generate_password(10)
    assert len(password) == 10
    
    password = generate_password(85)
    assert len(password) == 85


def test_length_less_than_one():
    """if the password length less than one"""
    with pytest.raises(ValueError):
        generate_password(0)
    
    with pytest.raises(ValueError):
        generate_password(-10)


def test_length_more_than_hundred():
    """if the password length more than hundred"""
    with pytest.raises(ValueError):
        generate_password(101)
    
    with pytest.raises(ValueError):
        generate_password(1000)