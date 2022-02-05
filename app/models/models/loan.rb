class Loan < ActiveRecord::Base
  belongs_to :loan_application
  attr_accessor :principal_amount, :years, :rate, :monthly_payment
end