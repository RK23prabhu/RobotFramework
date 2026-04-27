import random

def generate_random_user():
    return f"user_{random.randint(1000,9999)}"

def validate_text(expected, actual):
    if expected not in actual:
        raise AssertionError(f"{expected} not found in {actual}")
    return True