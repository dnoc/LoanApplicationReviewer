if ARGV.length != 1
  puts "Error: please give me exactly one filename as input"
  return;
end

input = File.new(ARGV[0], "r")
puts input.inspect

if input.exist?
  ApplicationReviewService.review(file: input)
else
  puts "Error: file #{ARGV[0]} doesn't exist"
end
