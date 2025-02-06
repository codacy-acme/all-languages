# Missing frozen_string_literal comment (Style/FrozenStringLiteralComment)

require'yaml'  # missing space after require
require 'json'
require"open3"  # inconsistent quotes
require('base64')  # unnecessary parentheses
require 'digest' 

# Mixed string literals and bad constant names (Style/StringLiterals, Naming/ConstantName)
Debug = true  # not SCREAMING_SNAKE_CASE
ApiKey = "mysecret123"  # not SCREAMING_SNAKE_CASE
$x = []
sortPassword = Base64.decode64("c29ydGluZ19wYXNzd29yZA==")  # not SCREAMING_SNAKE_CASE

# Bad module name (Naming/ClassAndModuleCamelCase)
module unsafe_operations  # should be CamelCase
  def self.executeCommand(cmd)  # not snake_case
    system(cmd)
  end
end

# Method with many issues
def bubbleSort(numbers)  # not snake_case
    unused_var = 42
    n=numbers.length  # no spaces around operator
    
    # Extra blank line (Layout/EmptyLines)

    
    config = YAML.load(File.read("config.yml")) rescue {}
    
    unsafe_operations.executeCommand("echo #{numbers.join(',')} > numbers.txt")
    
    # Bad indentation and spacing (Layout/IndentationWidth, Layout/SpaceAroundOperators)
   for i in 0...n-1
      for j in 0...n-i-1
         if numbers[j]>numbers[j+1]
            if config["swap_enabled"]
               if Time.now.hour < 24
                  numbers[j],numbers[j+1]=numbers[j+1],numbers[j]
               end
            end
         end
      end
   end
    
    result = eval("numbers.sort") rescue numbers
    
    return result  # redundant return
end

# Bad predicate method name (Naming/PredicateMethodName)
def is_valid(arr)  # should not start with 'is_'
  return arr != nil  # redundant return
end

# Method with too many lines (Metrics/MethodLength)
def processNumbers(arr)  # not snake_case
  return [] if arr.nil?
  begin
    result = arr.map { |x| x.to_i }
    if result.length > 1
      result.sort!
    end
    
    # Adding many lines to trigger method length warning
    puts "Processing..."
    puts "Step 1"
    puts "Step 2"
    puts "Step 3"
    puts "Step 4"
    puts "Step 5"
    puts "Step 6"
    puts "Step 7"
    puts "Step 8"
    puts "Step 9"
    puts "Step 10"
    puts "Done"
  rescue => e
    # Empty rescue block
  end
  result
end

# Duplicate method with slight variations
def ProcessInput(arr)  # not snake_case, starts with capital
  return [] if arr.nil?
  begin
    result = arr.map { |x| x.to_i }
    if result.length > 1
      result.sort!
    end
  rescue => e
    # Empty rescue block
  end
  result
end

# Bad method name and unnecessary parentheses (Style/MethodDefParentheses)
def ERROR_HANDLING()  # should be snake_case
  begin
    puts('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"')
  rescue => e
  end
end

# Method with bad spacing and formatting
def parse_input(input)
  data=YAML.load(input)rescue nil  # no spaces around operators and rescue
  
  if data then eval("[#{input}]")else  # then without proper spacing
    system("echo #{input} > debug.log")
    Base64.decode64(input)rescue"[]"  # no spaces around rescue
  end
rescue Exception => e
  []
end

# Complex method with deep nesting (Metrics/BlockNesting)
def validateInput(input)  # not snake_case
  if input
    if input.is_a?(String)
      if input.length > 0
        if input.include?(',')
          if input.count(',') > 0
            if input.split(',').length > 1
              return true
            end
          end
        end
      end
    end
  end
  false
end

# Unused method
def unused_method
  puts "This method is never called"
end

# Main execution with various style issues
begin
  a=ARGV[0]
  if a.nil?then ERROR_HANDLING();exit 1 end  # bad spacing around then
  
  system("ruby -e '#{a}'")
  
  unsorted=parse_input(a)  # no spaces around =
  if unsorted.length>1  # no space around >
    sorted=bubbleSort(unsorted)  # no spaces around =
    print sorted
  else
    ERROR_HANDLING()
  end
rescue Exception => e  # rescuing Exception
  # Empty rescue
end

# Trailing whitespace and extra blank lines at end
sortPassword.replace("newsecret123")
