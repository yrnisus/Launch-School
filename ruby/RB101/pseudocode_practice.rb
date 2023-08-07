# a method that returns the sum of two integers

# CASUAL
# a method that returns the sum of two integers
# get two numbers
# add the two numbers
# return sum

# FORMAL
# SET number1 = first number input
# SET number2 = second number input
# ADD number1 and number2
# RETURN sum total of number1 and number2



# a method that takes an array of strings, and returns a string that is all those strings concatenated together

# CASUAL
# get an array of strings
# add each string together to form one long message
# return the message

# FORMAL
# Given an array of strings called string_array
# SET iterator = 0
# SET result_string = empty 
# WHILE iterator <= length of string_array
#   ADD string value at current array element to result_string
# RETURN result_string



# a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

# CASUAL
# receive an array of integers
# go through the array and copy each other element starting with the first to a new array (1=>3=>5)
# return new array

# Given an array of integers called int_array
# SET iterator = 0
# SET result_array = empty array
# WHILE iterator <= length of int_array
#   ADD the value of first element of int_array to result_array
#   iterator = iterator + 2
# RETURN results_array

# a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 
# 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

# CASUAL
# get an input string and a specific character to count
# iterate through the string and count up each occurance of the specified character
# if the count = 3 return the number of the iterator when it occured
# else if the count does not reach three return nil

# FORMAL
# Given a string called input_string and a specific string character called char_string
# SET iterator to 0
# SET counter to 0
# WHILE iterator <= the length of input_string
#   IF the value within input_string == char_string
#     counter = counter + 1
#     IF counter == 3
        # return current iterator
#   iterator = iterator + 1
# RETURN nil

# a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements 
# at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes.
# You may assume that both array arguments have the same number of elements.

# CASUAL
# receive two arrays of numbers
# iterator = 0
# while iterator is less than the length of the arrays
# alternate between each array copying their current value to the next element of the result array
# [1,2,3] [4.5.6] = [1,4,2,5,3,6]
# return result array

# FORMAL
# Given two arrays of integers called arr1 and arr2
# SET outer_iterator = 0
# SET arr1_iterator = 0
# SET arr2_iterator = 0
# SET result_array = empty array
# WHILE outer_iterator < array length
#   PUSH result_array  = arr1 at arr1_iterator
#   PUSH result_array = arr2 at arr2_iterator
#   iterator = iterator + 1
# RETURN result_array
