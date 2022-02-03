require_relative "./src/loan_application_reviewer.rb"

if ARGV.length != 1
  puts "Error: please give me exactly one filename as input"
  return;
end

input = File.new(ARGV[0], "r")
puts input.inspect

if input.exist?
  LoanApplicationReviewer.review(file: input)
else
  puts "Error: file #{ARGV[0]} doesn't exist"
end
