# Homework 2
# two vectors of data monthly revenue and monthly expenses
#profit each month
#profit after tax for each month 30% of tax rate
#profit margin for each month - equals to profit after tax divided by revenue
#good month - where the profit after the tax was greater than the mean for the year
#bad month - where the profit after tax was less than the mean for the year
#the best month- where the profit after tax was max for the year
#the worst month -where the profit after tax was min for the year

#Data that given
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution-----------------------------------------------------------------------------

#profit each month
profit <- revenue - expenses
profit

#profit after tax for each month (tax rate is 30%)
tax <- round(profit *0.3,digit=2)
tax

profit_after_tax <- profit- tax
profit_after_tax

#profit margin for each month - equals to profit a after tax divided by revenue
profit_margin <- round(profit_after_tax/revenue,2)*100 #100 is the percentage
profit_margin

#good month - where the profit after tax was greater than the mean for the year
mean_for_the_year <- mean(profit_after_tax)
mean_for_the_year

good.months <- profit_after_tax > mean_for_the_year
good.months

#bad month - where the profit after tax was less than the mean for the year
bad_months <- profit_after_tax < mean_for_the_year
bad_months
#or you can use this
bad_months <- !good.months
bad_months
#the best month - where the profit after tax was max for the year
best_month <-profit_after_tax == max(profit_after_tax)
best_month
#the worst month - where the profit after tax was min for the year
worst_month <- profit_after_tax == min(profit_after_tax)
worst_month

#units of thousands
revenue_1000 <- round(revenue / 1000) # when we use round with 0 decimal, we do not need to put number
revenue_1000

expense_1000 <-round(expenses / 1000)
expense_1000

profit_1000 <- round(profit /1000)
profit_1000
profit_after_tax_1000 <- round(profit_after_tax/1000)
profit_after_tax_1000

#output
revenue_1000
expense_1000
profit_1000
profit_after_tax_1000
profit_margin
good.months
bad_months
best_month
worst_month

#matrices
m <- rbind(
  revenue_1000,
  expense_1000,
  profit_1000,
  profit_after_tax_1000,
  profit_margin,
  good.months,
  bad_months,
  best_month,
  worst_month
)
m


