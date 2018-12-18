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
 students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.map.with_index do |student, index|
      puts "#{index + 1}. #{student[:name]}, (#{student[:cohort]} cohort). Hobby: #{student[:hobby]}. Born: #{student[:country]}"
  end
end

# finally, we print the total using the count method to total the elements in the array
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
