class Income < ActiveRecord::Base
  SCHEMA_NAME = "INCOME".freeze

  belongs_to :loan_application

  attr_accessor :name, :kind, :monthly_amount

  validates_presence_of :name, :kind, :monthly_amount

  def initialize(loan_application_id, name, kind, monthly_amount)
    @loan_application_id = loan_application_id
    @name = name
    @kind = kind
    @monthly_amount = monthly_amount
  end

  def self.build_from_string(string:, loan_application_id:)
    tokens = string.split(" ")
    self.new(loan_application_id, tokens[1], tokens[2], tokens[3])
  end
end