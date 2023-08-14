def calc_tip
  puts "What is the bill?"
  bill_amount = gets.chomp.to_i
  puts "What is the tip percentage?"
  tip_percentage = gets.chomp.to_f

  tip_amount = bill_amount * (tip_percentage * 0.01)
  puts "The tip is $#{sprintf('%0.02f', (tip_amount))}"
  puts "The total is $#{sprintf('%0.02f', (bill_amount + tip_amount))}"

end

calc_tip


=begin
1 prompt user for bill
2 prompt user for tip percentage
3 calculate the tip amount (bill * tip percentage)
4 display total (bill + tip amount)

=end