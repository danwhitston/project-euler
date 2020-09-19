# frozen_string_literal: true

require 'prime'

# Euler Problem 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
# without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# Return the lowest common multiple of positive integers from 1 to upper_bound
def p005(upper_bound = 20)
  # This builds on the idea that any value which is a multiple of another value can be used instead of it
  # Also that the lowest common multiple is a product of the minimal set of prime-multiples that cover the factors
  # So e.g. the lowest common multiple of 1..6 would be 5 x 2 x 2 x 3 = 60, where 2 appears twice because 2 x 2 = 4
  required_factors = (2..upper_bound).to_a
  required_primes = {}
  required_factors.each do |factor|
    required_primes.merge!(Prime.prime_division(factor).to_h) do |_prime_factor, old_multiple, new_multiple|
      [old_multiple, new_multiple].max
    end
  end
  required_primes.reduce(1) { |common_multiple, prime_multiple| common_multiple * prime_multiple[0]**prime_multiple[1] }
end

puts p005 if __FILE__ == $PROGRAM_NAME
