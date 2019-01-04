@students = []

def input_students
  puts "Please enter the name of the student"
  name = STDIN.gets.delete("\n")
  while !name.empty? do
    puts "Please enter student's cohort"
    cohort = STDIN.gets.chomp
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students."
    puts "Please enter the name of the next student"
    puts "To finish, just hit return again"
    name = STDIN.gets.chomp
  end
  @students.each do |student|
    if student[:cohort].empty?
      student[:cohort] << "Unknown"
    end
  end
 @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.length >= 1
    def pick_cohort
      puts "Which cohort would you like to view?"
      cohort = STDIN.gets.chomp
      if cohort.empty?
        pick_cohort
      end
      cohort
    end
    cohort = pick_cohort
    @students.each_with_index do |student, index|
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
def print_footer
  if @students.length == 1
    puts "Overall, we have 1 great student"
  else puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the students from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit #terminate program
    else
      puts "Not recognised. Try again."
    end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp) #pass user selection as the argument to process
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
