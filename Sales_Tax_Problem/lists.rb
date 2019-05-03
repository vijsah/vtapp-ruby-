# List Of Products
class ListCreator
  SALES_TAX_CONSTANT = 0.10
  IMPORT_DUTY = 0.05
  def initialize
    @list = []
  end

  def add_list_items
    print 'Name of the product: '
    product_name = gets.chomp
    print 'Imported?: '
    imported = gets.chomp
    print 'Exempted from sales tax?: '
    tax_exempted = gets.chomp
    print 'Price: '
    price = gets.chomp.to_i
    sales_tax = sales_tax_calculator(tax_exempted, price)
    import_duty = import_duty_calculator(imported, price)
    total_price = total_price_calculator(sales_tax, import_duty, price)
    [product_name, price, sales_tax, import_duty, total_price]
  end

  def sales_tax_calculator(tax_exempted, price)
    if tax_exempted == 'yes'
      0.0
    elsif tax_exempted == 'no'
      (price * SALES_TAX_CONSTANT).round(3)
    end
  end

  def import_duty_calculator(imported, price)
    if imported == 'yes'
      (price * IMPORT_DUTY).round(3)
    elsif imported == 'no'
      0.0
    end
  end

  def total_price_calculator(salestax, importduty, price)
    salestax + importduty + price
  end

  def print_list(list)
    puts 'Product_Name    Price    Sales_tax      Import_duty     Total_Price'
    list.each { |name, price, tax, duty, total_price| puts name.ljust(16) + price.to_s.ljust(9) + tax.to_s.ljust(15) + duty.to_s.ljust(16) + total_price.to_s }
    sum = 0.0
    list.each do |element|
      sum += element[4]
    end
    puts '-' * 67
    puts "Total Sum of Products is: #{sum.round(0)}"
  end

  def create_list
    @list.push(add_list_items)
    x = ''
    loop do
      print 'Do you want to add more items to the list(y/n): '
      x = gets.chomp
      puts "\n"
      x == 'y' ? @list.push(add_list_items) : break
    end
    print_list(@list)
  end
end
list_creator = ListCreator.new
list_creator.create_list