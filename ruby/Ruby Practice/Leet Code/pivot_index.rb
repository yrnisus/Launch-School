=begin
Given an array of integers nums, calculate the pivot index of this array.

The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.

If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.

Return the leftmost pivot index. If no such index exists, return -1.

Example 1:

Input: nums = [1,7,3,6,5,6]
Output: 3

Input: nums = [2,1,-1]
Output: 0

Input: nums = [1,2,3]
Output: -1

Problem: Find the pivot index of a given array.
Definition: Pivot index is the index where the sum of the elements to the left and right are equal

Rules: The left sum of index 0 is 0. The right index of -1 is 0.
Return -1 if no such index exists.

DS: Arrays

Algorithm:
Create a method that takes an array arr
if arr.size is 1 return -1
For each element in the array
Check the sum of elements to left and sum of elements to the right
If the sums are equal return index
Else continue
Return -1 if iteration completes

=end

def pivot_index(nums)
  sum = nums.sum
  left = 0

  nums.each_with_index do |num, index|
    return index if left == sum - left - num

    left += num
  end
  return -1
end

def pivot_index(nums)
  return 0 if nums.size == 1

  nums.each_index do |index|
    return index if nums[0...index].sum == nums[index+1..].sum
  end

  return -1
end

p pivot_index([1,7,3,6,5,6])

p pivot_index([2,1,-1])

p pivot_index([1,2,3])