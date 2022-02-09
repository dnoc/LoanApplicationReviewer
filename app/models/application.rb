class Application < ActiveRecord::Base
  SCHEMA_NAME = "APPLICATION".freeze

  has_many :borrowers
  has_many :incomes
  has_many :liabilities
  has_many :loans
  has_many :decisions

  attr_accessor :provided_id

  validates_presence_of :provided_id
  validates :borrowers, length: { within: 1..2 }
  validates :loans, length: { minimum: 1 }

  def initialize(provided_id:)
    @provided_id = provided_id
  end

  def self.build_from_string(string:)
    tokens = string.split(" ")
    Application.new(provided_id: tokens[1])
  end

  def credit_score
    borrowers.min_by { |b| b.credit_score }
  end

  def dti
    total_loan_payments = loans.sum { |loan| loan.monthly_payment }
    applicable_liabilities = liabilities.filter { |l| l.applicable_to_dti? }

    total_applicable_liability = total_loan_payments + applicable_liabilities.sum { |l| l.monthly_payment }

    total_applicable_liability / incomes.sum { |i| i.monthly_amount }
  end
end