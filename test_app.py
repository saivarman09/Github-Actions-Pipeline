from app import add_numbers, greet


def test_add_numbers():
    assert add_numbers(2, 3) == 5


def test_greet():
    assert greet("Sai") == "Hello, Sai!"


def test_negative_numbers():
    assert add_numbers(-2, -3) == -5