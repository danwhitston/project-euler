# Euler Problem 2
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the
# first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the
# even-valued terms.

def p002(max_value = 4000000):
  current_value = 2
  previous_value = 1
  fibonacci_sum = 2
  while(current_value <= max_value):
    new_value = previous_value + current_value
    if new_value % 2 == 0:
      fibonacci_sum += new_value
    previous_value = current_value
    current_value = new_value
  return fibonacci_sum

print(p002())