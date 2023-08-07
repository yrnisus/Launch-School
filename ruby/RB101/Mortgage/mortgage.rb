# inputs
# loan amount
# annual percentage rate
# loan duration

# outputs
# monthly interest rate
# loan duration in months
# monthly payment

# determine the monthly interest rate, duration of the loan in months,
# and the amount of money paid monthly for a given loan amount, annual
# percentage rate, and duration

# monthly payment = loan_amount * (monthly_interest_rate
# / (1 - (1 + monthly_interest_rate)**(-loan_duration in months)))

# ex1
# loan amount = 10_000
# apr = 5%
# loan_duration = 5 years (60 months)

# total = 11322.74
# monthly interest .6
# loan duration 60 months
# monthly payment 188.20 dollars

loan_amount = 10000
annual_percentage_rate = 0.05
loan_duration_years = 5

monthly_interest_rate = annual_percentage_rate / 12
loan_duration_months = loan_duration_years * 12

monthly_payment = loan_amount * (monthly_interest_rate /
(1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

puts monthly_interest_rate.round(3)
puts loan_duration_months
puts monthly_payment.round(2)
