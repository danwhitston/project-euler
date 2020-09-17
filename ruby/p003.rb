# frozen_string_literal: true

# Euler Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# Simple solution: the lowest divisor that leaves 0 leftover is the lowest prime factor.
# Dividing by that gives the largest prime factor?
def p003(total_remaining = 600_851_475_143)
  divisor = 2
  until divisor >= total_remaining
    if (total_remaining % divisor).zero?
      total_remaining /= divisor
    else
      divisor += 1
    end
  end
  divisor
end

puts p003 if __FILE__ == $PROGRAM_NAME
