# frozen_string_literal: true

# The sum of the squares of the first ten natural numbers is 1^2 + 2^2 + ... + 10^2 = 385

# The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)^2 = 55^2 = 3025

# Hence the difference between the sum of the squares of the first ten natural numbers and the
# square of the sum is 3025 - 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers
# and the square of the sum.

# Returns the square of the sum of natural numbers to upper_bound, minus the sum of the squares
def p006(upper_bound = 100)
  # So the simplest way to do this is to calculate each, then subtract one from the other.
  # Alternatively, (1 + 2 + 3)*(1 + 2 + 3) = 1^2 + 2^2 + 3^2 + 1*(2 + 3) + 2*(1 + 3) + 3*(1 + 2)
  # So the difference is 1*(sum - 1) + 2*(sum - 2) + 3*(sum - 3)
  range = 0..upper_bound
  sum = range.reduce(:+)
  range.reduce { |difference, number| difference + number * (sum - number) }
end

puts p006 if __FILE__ == $PROGRAM_NAME
