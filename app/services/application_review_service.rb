class ApplicationReviewService
  def self.review(file:)
    applications = _read_file(file)

    application_decisions = _make_decisions(applications)
    _print_decisions(application_decisions)
    
    application_decisions
  end

  private

  def _read_file(file)
    applications = []
    file.readlines("") do |line|
      if (line.present?)
        object = ApplicationObjectFactory.from_string(string: line, loan_application_id: applications.last&.id)
        object.save!

        if object.is_a?(LoanApplication)
          applications << object # reload?
        end
      end
    end

    applications
  end

  def _make_decisions(applications)
    decisions = []

    applications.each do
      ApplicationDecision.create!(dti: application.dti, credit_score: application.credit_score)
    end

    decisions
  end

  def _print_decisions(decisions)
    approval_count = decisions.select { |d| d.approved? }.length
    approval_rate_string = sprintf("%0.02f", approval_count.to_f / decisions.length)

    puts ""
    puts "Summary: #{approval_count} application approved, #{decisions.length} applications received, #{approval_rate_string} approval rate"
    puts ""

    decisions.each do |d|
      puts "#{d.application.provided_id}: #{d.approved? ? 'approved' : 'denied'}, DTI: #{d.dti}, Credit Score: #{d.credit_score}"
    end
  end
end