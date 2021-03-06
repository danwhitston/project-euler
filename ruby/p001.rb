# frozen_string_literal: true

# Euler Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def p001(upper_bound = 999)
  (1..upper_bound).select { |number| (number % 3).zero? || (number % 5).zero? }.reduce(:+)
end

puts p001 if __FILE__ == $PROGRAM_NAME
