class Liability < ActiveRecord::Base
  SCHEMA_NAME = "LIABILITY".freeze
  MIN_APPLICABLE_PAYMENTS = 10.freeze

  belongs_to :loan_application

  attr_accessor :comma_separated_names, :kind, :monthly_payment, :outstanding_balance

  validates_presence_of :comma_separated_names, :kind, :monthly_payment, :outstanding_balance

  def initialize(loan_application_id, comma_separated_names, kind, monthly_payment, outstanding_balance)
    @loan_application_id = loan_application_id
    @comma_separated_names = comma_separated_names
    @kind = kind
    @monthly_payment = monthly_payment
    @outstanding_balance = outstanding_balance
  end

  def self.build_from_string(string:, loan_application_id:)
    tokens = string.split(" ")
    self.new(loan_application_id, tokens[1], tokens[2], tokens[3], tokens[4])
  end

  def applicable_to_dti?
    outstanding_balance / monthly_payment > MIN_APPLICABLE_PAYMENTS
  end
end