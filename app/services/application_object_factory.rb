class ApplicationObjectFactory
  def self.from_string(string:, loan_application_id:)
    case
    when string.start_with?(LoanApplication::SCHEMA_NAME)
      LoanApplication.build_from_string(string: string)
    when string.start_with?(Loan::SCHEMA_NAME)
      Loan.build_from_string(string: string, loan_application_id: loan_application_id)
    when string.start_with?(Borrower::SCHEMA_NAME) || string.start_with?(Borrower::COBORROWER_SCHEMA_NAME)
      Borrower.build_from_string(string: string, loan_application_id: loan_application_id)
    when string.start_with?(Liability::SCHEMA_NAME)
      Liability.build_from_string(string: string, loan_application_id: loan_application_id)
    when string.start_with?(Income::SCHEMA_NAME)
      Income.build_from_string(string: string, loan_application_id: loan_application_id)
    end
  end
end