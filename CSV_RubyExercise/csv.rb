require 'csv'
# Reading a csv file and writing a new file with data in the csv file
class Employee
  def read_file(file_path)
    CSV.read(file_path)
  end

  def extract_details(file_data)
    array_of_file_data = file_data.to_a[1..-1]
    array_of_file_data.sort_by.group_by { |array| array[2] }
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

  def get_details_from_csv(file_path)
    file_data = read_file(file_path)
    extracted_details = extract_details(file_data)
    save_details(extracted_details)
  end
end
employee = Employee.new
employee.get_details_from_csv('employee.csv')