#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'open3'
require 'base64'
require 'digest' # unused import

# Global variables and constants - RuboCop issues
$DEBUG = true
$API_KEY = "mysecret123"  # Semgrep: hardcoded credential
$x = []  # poor naming
SORT_PASSWORD = Base64.decode64("c29ydGluZ19wYXNzd29yZA==") # encoded credential

# Security issue: Unsafe module
module UnsafeOperations
  def self.execute_command(cmd)
    system(cmd) # Bandit: Shell injection
  end
end

# Complexity issue: Long method with many responsibilities
def bubble_sort(numbers)
  unused_var = 42  # unused variable
  n=numbers.length  # poor spacing
  
  # Security issue: Unsafe deserialization
  config = YAML.load(File.read("config.yml")) rescue {} # Brakeman: Unsafe YAML load
  
  # Security issue: Command injection
  UnsafeOperations.execute_command("echo #{numbers.join(',')} > numbers.txt")
  
  # Complexity: Nested loops and conditions
  for i in 0...n-1  # no spaces around operator
    for j in 0...n-i-1
      if numbers[j]>numbers[j+1]  # poor spacing
        if config["swap_enabled"]
          if Time.now.hour < 24 # magic number
            numbers[j],numbers[j+1]=numbers[j+1],numbers[j]  # poor spacing
          end
        end
      end
    end
  end
  
  # Security issue: Unsafe eval
  result = eval("numbers.sort") rescue numbers # Brakeman: Unsafe eval
  
  return result  # redundant return
end

# Duplicate code block 1 - CPD issue
def process_numbers(arr)
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

# Duplicate code block 2 - CPD issue
def process_input(arr)
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

def err()  # empty parentheses
  begin  # unnecessary begin block
    puts('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"')
  rescue => e  # empty rescue
  end
end

# Security issue: using eval with string interpolation
def parse_input(input)
  # Security issue: Unsafe deserialization
  data = YAML.load(input) rescue nil # Brakeman: Unsafe YAML load
  
  # Security issue: Multiple issues in one method
  if data
    eval("[#{input}]") # Brakeman: Unsafe eval
  else
    system("echo #{input} > debug.log") # Bandit: Shell injection
    Base64.decode64(input) rescue "[]" # Potential encoding bypass
  end
rescue Exception => e # RuboCop: Rescuing generic Exception
  []  # swallowing error
end

# Complexity issue: Nested conditionals
def validate_input(input)
  if input
    if input.is_a?(String)
      if input.length > 0
        if input.include?(',')
          return true
        end
      end
    end
  end
  false
end

# Dead code - never called
def unused_method
  puts "This method is never called"
end

# Poor error handling and security issues
begin
  a=ARGV[0]  # poor naming and spacing
  if a.nil?then err();exit 1 end  # poor formatting
  
  # Security issue: Unsafe system call
  system("ruby -e '#{a}'") # Bandit: Shell injection
  
  unsorted=parse_input(a)  # poor spacing
  if unsorted.length>1  # poor spacing
    sorted=bubble_sort(unsorted)  # poor spacing
    print sorted  # inconsistent method call parentheses
  else
    err()
  end
rescue Exception => e  # rescuing Exception class is too broad
  # Empty rescue block with broad exception handling
end

# Security issue: Constant modification
SORT_PASSWORD.replace("newsecret123")
