def input_students
  puts "Please enter the name of the student"
  students = []
  name = gets.delete("\n")
  while !name.empty? do
    puts "Please enter student's cohort"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students."
    puts "Please enter the name of the next student"
    puts "To finish, just hit return again"
    name = gets.chomp
  end
  students.each do |student|
    if student[:cohort].empty?
      student[:cohort] << "Unknown"
    end
  end
 students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def display(students)
  if students.length >= 1
    def pick_cohort
      puts "Which cohort would you like to view?"
      cohort = gets.chomp
      if cohort.empty?
        pick_cohort
      end
      cohort
    end
    cohort = pick_cohort
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        print "#{index + 1}. #{student[:name]}"
        puts "(#{student[:cohort]} cohort)".rjust(60 - student[:name].length)
      end
    end
  else
    puts "List empty."
  end
end

# finally, we print the total using the count method to total the elements in the array
def print_footer(students)
  if students.length == 1
    puts "Overall, we have 1 great student"
  else puts "Overall, we have #{students.count} great students"
  end
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      display(students)
      print_footer(students)
    when "9"
      exit #terminate program
    else
      puts "Not recognised. Try again."
    end
  end
end

interactive_menu
