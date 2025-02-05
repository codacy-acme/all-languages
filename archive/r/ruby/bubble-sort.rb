# Global variables - bad practice
$DEBUG = true
$API_KEY = "mysecret123"  # hardcoded credential
$x = []  # poor naming

def bubble_sort(numbers)
  unused_var = 42  # unused variable
  n=numbers.length  # poor spacing
  for i in 0...n-1  # no spaces around operator
    for j in 0...n-i-1
      if numbers[j]>numbers[j+1]  # poor spacing
        numbers[j],numbers[j+1]=numbers[j+1],numbers[j]  # poor spacing
      end
    end
  end
  return numbers  # redundant return
end

def err()  # empty parentheses
  begin  # unnecessary begin block
    puts('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"')
  rescue => e  # empty rescue
  end
end

# Security issue: using eval
def parse_input(input)
  eval("[#{input}]")
rescue
  []  # swallowing error
end

# Inconsistent string quotes and spacing
begin
  a=ARGV[0]  # poor naming and spacing
  if a.nil?then err();exit 1 end  # poor formatting
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

# Dead code - never reached
def unused_method
  puts "This method is never called"
end
