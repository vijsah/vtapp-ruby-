require 'csv'
# Reading a csv file and writing a new file with data in the csv file
class Employee

	def read_file(employee_file)
    CSV.read(employee_file)
  end

  def extract_details(file_data)
    array_of_file_data = file_data.to_a[1..-1]
    details = array_of_file_data.sort_by.group_by { |array| array[2] }
  end

  def save_details(details)
    File.open("employee.txt", "w") do |file|
      details.each do |designation, value|
        file.puts "#{designation}#{'s' if details[designation].length > 1}"
        value.each { |detail| file.puts "#{detail[0]} (EmpId:#{detail[1]})" }
        file.puts
      end
    end
  end


  def get_details_from_csv(employee_file)
    file_data = read_file(employee_file)
    extracted_details = extract_details(file_data)
    save_details(extracted_details)
  end

end
employee = Employee.new
employee.get_details_from_csv('employee.csv')