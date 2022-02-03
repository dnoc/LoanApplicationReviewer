class LoanApplicationReviewer
  def self.review(:file)
    puts file.path
  end
end


if ARGV.length != 1
  puts "Error: please give me exactly one filename as input"
  return;
end

input = File.new(ARGV[0], "r")

if file.exist?
  LoanApplicationReviewer.review(file: input)
else
  puts "Error: file #{ARGV[0]} doesn't exist"
end
