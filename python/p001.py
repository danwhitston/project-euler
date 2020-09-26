# Euler Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def p001(upper_bound=999):
    all_numbers = range(1, upper_bound + 1)
    matching_numbers = [x for x in all_numbers if x % 5 == 0 or x % 3 == 0]
    return sum(matching_numbers)


print(p001())
