
=begin

Iterate through the array comparing element value until current element is
less than the next element

counter to count swaps, return array when counter is 0
loop


=end

def bubble_sort!(arr)
  loop do
    swapped = false
    (1..arr.size-1).each do |index|
      case arr[index-1] <=> arr[index]
      when 1
        arr[index-1], arr[index] = arr[index], arr[index-1]
        swapped = true
      when 0 then continue
      end
    end
    break if !swapped
  end
  arr
end





# def bubble_sort!(arr)
#   n = arr.size
#   loop do
#     swapped = false
#     1.upto(n-1) do |i|
#       if arr[i-1] > arr[i]
#         arr[i-1], arr[i] = arr[i], arr[i-1]
#         swapped = true
#       end
#     end
#     break if !swapped
#   end
#   arr
# end




array = [5, 3]
p bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)