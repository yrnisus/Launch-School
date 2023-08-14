=begin
Given an array of productrs, write a function that works as a vending machine.
Return the correct product and change left over from input amount.

method receives a product name and an amount of money.
method returns an object containing the product name and change in an array

If product number is invalid return "enter valid product number"

If money isn't enough return "not enough money for this product"

test cases:

vendingMachine(200, 1) // {product: 'Orange Juice', change: [100]}

vendingMachine(200, 9) // {product: 'Small snack', change: [100, 20]}

vendingMachine(200, 7) // { product: "Crackers", change: [ 50, 20, 10 ] }

vendingMachine(500, 8) // { product: 'Potato chips', change: [ 200, 50, 20, 10 ] }

vendingMachine(200, 0) // "Enter a valid product number".

vendingMachine(10, 2) // "Not enough money for this product".

vendingMachine(150, 3) // {product: 'Chocolate snack', change: []}

ds: array of hash objects

input: money (number) product number (number)
output: object with two properties:
product (product name)
change (array of coins, can be empty, MUST be in descending order)

algorithm:
-Use the input product number to find the correct product in the array
-If the product doesnt exist return "Enter a valid product number"
-If the money isn't enough return "Not enough money for this product"
-Subtract the product cost from the input money
-create a new object
-give the new object the selected product name
-create a change array
-Divide the remaining money into coin denominations
starting with the largest possible
-Push each coin into the change array
-Return the object with product name and change array

=end

PRODUCTS = [
{ number: 1, price: 100, name: 'Orange juice' },
{ number: 2, price: 200, name: 'Soda' },
{ number: 3, price: 150, name: 'Chocolate snack' },
{ number: 4, price: 250, name: 'Cookies' },
{ number: 5, price: 180, name: 'Gummy bears' },
{ number: 6, price: 500, name: 'Condoms' },
{ number: 7, price: 120, name: 'Crackers' },
{ number: 8, price: 220, name: 'Potato chips' },
{ number: 9, price: 80,  name: 'Small snack' },
]

VALID_COINS = [500, 200, 100, 50, 20, 10]

def vending_machine(money, product_number)
  product = PRODUCTS.select { |product| product[:number] == product_number }.first
  if !product
    return "Enter a valid product number"
  elsif product[:price] > money
    return "Not enough money for this product"
  else
    change = get_change(money - product[:price])
  end
    { product: product[:name], change: change }
end

def get_change(cost)
  index = 0
  change = []
  loop do
    if VALID_COINS[index] <= cost
      cost -= VALID_COINS[index]
      change << VALID_COINS[index]
    else
      index += 1
    end
    break if cost == 0
  end
  change
end

p vending_machine(200, 1) == {product: 'Orange juice', change: [100]}
p vending_machine(200, 9) == {product: 'Small snack', change: [100, 20]}
p vending_machine(200, 7) == { product: "Crackers", change: [ 50, 20, 10 ]}
p vending_machine(500, 8) == { product: 'Potato chips', change: [ 200, 50, 20, 10 ]}
p vending_machine(200, 0) == "Enter a valid product number"
p vending_machine(10, 2) =="Not enough money for this product"
p vending_machine(150, 3) == {product: 'Chocolate snack', change: []}