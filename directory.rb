def input_students
  puts "Please enter the names of the students, followed by the students hobby, and country of birth"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    hobby = gets.chomp
    country_of_birth = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, country: country_of_birth}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end
  students.each do |data|
    if data[:hobby].empty?
      data[:hobby] << "Unknown"
    end
  end
 students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def display(students)
  students.each_with_index do |student, index|
    print "#{index + 1}. #{student[:name]}, (#{student[:cohort]} cohort)".ljust(40)
    print " Hobby: #{student[:hobby]}".ljust(40)
    puts " Birthplace: #{student[:country]}"
  end
end

# finally, we print the total using the count method to total the elements in the array
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
display(students)
print_footer(students)
