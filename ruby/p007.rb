# frozen_string_literal: true

require 'prime'

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

# Return the nth prime number
def p007(n = 10_001)
  return 2 if n == 1

  primes = Prime.each
  (n - 1).times { primes.next }
  primes.next
end

puts p007 if __FILE__ == $PROGRAM_NAME
