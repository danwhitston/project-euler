# Euler Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# Simple solution: manually iterate through every possible divisor from 2 upwards, and divide whenever
# possible without remainder. When the divisor has the same value as the
# remainder, we have the prime factor

# Find the largest prime factor of a number
def p003(total_remaining=600851475143):
    divisor = 2
    while divisor < total_remaining:
        if total_remaining % divisor == 0:
            total_remaining //= divisor
        else:
            divisor += 1
    return divisor


print(p003())
