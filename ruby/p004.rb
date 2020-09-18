# frozen_string_literal: true

# Euler Problem 4
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers

# Store and manipulate Palindromic numbers
class Palindrome < Numeric
  # Return the lowest palindrome above a given number
  def self.round_up(number)
    return new(number) if valid?(number)

    new(full_palindrome(left_half(number) + 1))
  end

  # Return the highest palindrome below a given number
  def self.round_down(number)
    return new(number) if valid?(number)

    new(full_palindrome(left_half(number) - 1))
  end

  # Converts the left half of a palindrome to the full number
  def self.full_palindrome(left_side)
    (left_side.to_s + left_side.to_s.reverse).to_i
  end

  # Return the left half of an integer, including a middle digit
  def self.left_half(number)
    number_string = number.to_s
    number_string[0, (number_string.length.to_f / 2).ceil].to_i
  end

  # Returns true if the parameter is a palindromic number
  def self.valid?(number)
    number == number.to_s.reverse.to_i # string-based is faster than numeric
  end

  def initialize(number)
    raise 'Not a valid palindrome' unless self.class.valid?(number)

    @palindrome = number
  end

  # Find the next palindromic number below the current one
  def decrement!
    @palindrome = self.class.full_palindrome(self.class.left_half(@palindrome) - 1)
  end

  # Is a palindrome greater than or equal to an integer-coerced object
  def >=(other)
    @palindrome >= other.to_i
  end

  # Divide a palindromic number by an integer-coerced value
  def /(other)
    @palindrome / other.to_i
  end

  # Subtract an integer-coerced value from a palindromic number 
  def -(other)
    @palindrome - other.to_i
  end

  # Return the integer value of a palindromic number
  def to_i
    @palindrome
  end
end

# Find the largest palindrome made from the product of two X-digit numbers
def p004(number_of_digits = 3)
  # Method without lots of stored results:
  # 1. Find the largest product of two X-digit numbers, i.e. 999 * 999
  # 2. Iterate through palindromes in descending order
  # 3. If a palindrome is the product of two X-digit numbers then return it
  #
  # Notes:
  # - This does not currently support palindromic numbers with an odd number of digits
  # - To figure out if a number is the product of two X-digit numbers, an iterative bounding method makes sense
  current_palindrome = Palindrome.round_down(largest(number_of_digits)**2)
  smallest_palindrome = Palindrome.round_up(smallest(number_of_digits)**2)

  while current_palindrome >= smallest_palindrome
    # Is there an X-digit divisor with no remainder and X-digit result?
    divisor_pair = find_divisor(current_palindrome, number_of_digits)
    return current_palindrome.to_i if divisor_pair

    # There isn't, let's try the next palindrome down
    current_palindrome.decrement!
  end
end

# Returns a pair of X-digit numbers with product Y, or false if none exist
def find_divisor(product, number_of_digits)
  divisor = largest(number_of_digits)
  lower_bound = smallest(number_of_digits)

  until forms_a_pair_with(product, divisor) || divisor < lower_bound
    divisor -= 1
  end

  return [divisor, product / divisor] if forms_a_pair_with(product, divisor)

  false
end

# Returns true if the result of dividing is an integer with as many digits as the divisor
def forms_a_pair_with(product, divisor)
  (product % divisor).zero? && (product / divisor).to_s.length == divisor.to_s.length
end

# Largest integer for a set number of decimal digits
def largest(number_of_digits)
  ('9' * number_of_digits).to_i
end

# Smallest integer for a set number of decimal digits
def smallest(number_of_digits)
  ('1' * number_of_digits).to_i
end

puts p004 if __FILE__ == $PROGRAM_NAME
