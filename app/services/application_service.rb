class ApplicationService
  def self.review(file:)
    puts file.path

    file.path
  end

  private

  def read_file(file) do
    file.readlines("") do |line|
      if (line.present?)
        ApplicationObjectFactory.from_string(string: line)
      end
    end
  end
end