# frozen_string_literal: true

# Euler Problem 4
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers

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
  current_palindrome = palindrome_round_down(largest(number_of_digits)**2)
  smallest_palindrome = palindrome_round_up(smallest(number_of_digits)**2)

  while current_palindrome >= smallest_palindrome
    # Is there an X-digit divisor with no remainder and X-digit result?
    divisor_pair = find_divisor(current_palindrome, number_of_digits)
    return current_palindrome if divisor_pair

    # There isn't, let's try the next palindrome down
    current_palindrome = palindrome_decrement(current_palindrome)
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

# Find the lowest palindrom above a given number
def palindrome_round_up(number)
  return number if palindromic?(number)

  full_palindrome(left_half(number) + 1)
end

# Find the highest palindrome below a given number
def palindrome_round_down(number)
  return number if palindromic?(number)

  full_palindrome(left_half(number) - 1)
end

# Returns true if the parameter is a palindromic number
def palindromic?(number)
  number == number.to_s.reverse.to_i # string-based is faster than numeric
end

# Converts the left half of a palindrome to the full number
def full_palindrome(left_side)
  (left_side.to_s + left_side.to_s.reverse).to_i
end

# Return the left half of an integer, including a middle digit
def left_half(number)
  number_string = number.to_s
  number_string[0, (number_string.length.to_f / 2).ceil].to_i
end

# Find the next palindromic number below the current one
def palindrome_decrement(source_palindrome)
  full_palindrome(left_half(source_palindrome) - 1)
end

puts p004 if __FILE__ == $PROGRAM_NAME
