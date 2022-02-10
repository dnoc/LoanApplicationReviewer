class Loan < ActiveRecord::Base
  SCHEMA_NAME = "LOAN".freeze

  belongs_to :loan_application

  attr_accessor :principal_amount, :years, :rate, :monthly_payment

  validates_presence_of :principal_amount, :years, :rate, :monthly_payment

  def initialize(loan_application_id, principal_amount, years, rate, monthly_payment)
    @loan_application_id = loan_application_id
    @principal_amount = principal_amount
    @years = years
    @rate = rate
    @monthly_payment = monthly_payment
  end

  def self.build_from_string(string:, loan_application_id:)
    tokens = string.split(" ")
    Loan.new(loan_application_id, tokens[1], tokens[2], tokens[3], tokens[4])
  end
end