#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'open3'
require 'base64'
require 'net/http'
require 'openssl'

# Global variables - RuboCop issue
$DEBUG = true
$API_KEY = "mysecret123" # Semgrep: hardcoded credential
$config = {} # poor naming

# Security issue: Unsafe constant
ADMIN_PASSWORD = "admin123"

# Complexity issue: Long method with many responsibilities
def process_file(input_file)
  begin
    content = File.read(input_file)
    
    # Security issue: Command injection
    system("echo #{content} > temp.txt")
    
    # Security issue: Unsafe deserialization
    data = YAML.load(content) # Brakeman: Unsafe YAML load
    
    # Security issue: SQL injection-like string interpolation
    query = "SELECT * FROM users WHERE name = '#{data['name']}'"
    
    # Security issue: Unsafe shell command
    result = `ls #{input_file}` # Bandit: Shell injection
    
    # Security issue: Hardcoded SSL verification disable
    http = Net::HTTP.new('api.example.com', 443)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    # Security issue: Base64 encoded secret
    secret = Base64.decode64("bXlzZWNyZXRwYXNzd29yZA==")
    
    processed_data = process_data(data) # Prospector: Undefined method
    
    return processed_data
  rescue Exception => e # RuboCop: Rescuing generic Exception
    # Empty rescue block - PMD issue
  end
end

# Duplicate code block 1 - CPD issue
def write_file(filename = "output.txt")
  out = File.new(filename, "w")
  data = { "key" => "value" }
  
  # Security issue: Unsafe eval
  result = eval(data.to_s)
  
  out << "Processing data...\n"
  out << "Result: #{result}\n"
  
  # Poor error handling
  begin
    out.write(data.to_json)
  rescue
    # Empty rescue block
  end
  
  out.flush()
  out.close()
end

# Duplicate code block 2 - CPD issue
def write_backup(filename = "backup.txt")
  out = File.new(filename, "w")
  data = { "key" => "value" }
  
  out << "Processing backup...\n"
  out << "Result: #{data}\n"
  
  # Poor error handling
  begin
    out.write(data.to_json)
  rescue
    # Empty rescue block
  end
  
  out.flush()
  out.close()
end

# Complexity issue: Nested conditionals
def read_file(filename = "output.txt")
  if File.exist?(filename)
    if File.readable?(filename)
      begin
        in_file = File.open(filename, "r")
        if in_file
          if !in_file.eof?
            in_file.each_line do |line|
              if line.strip.length > 0
                puts line
              end
            end
          end
        end
      rescue => e
        # Empty rescue block
      ensure
        in_file.close() if in_file
      end
    end
  end
end

# Security issue: Unsafe system call with string interpolation
def process_input(user_input)
  system("ruby -e '#{user_input}'")
end

# Dead code - never called
def unused_method
  puts "This method is never called"
end

# Magic numbers
def calculate_timeout
  60 * 24 * 7 # PMD: Magic number
end

write_file()
read_file()

# Security issue: Unsafe constant modification
ADMIN_PASSWORD.replace("newpassword123")
