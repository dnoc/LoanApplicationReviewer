class Borrower < ActiveRecord::Base
  SCHEMA_NAME = "BORROWER".freeze
  COBORROWER_SCHEMA_NAME = "COBORROWER".freeze

  belongs_to :loan_application

  attr_accessor :name, :credit_score

  validates_presence_of :name, :credit_score

  def initialize(loan_application_id, name, credit_score)
    @loan_application_id = loan_application_id
    @name = name
    @credit_score = credit_score
  end

  def self.build_from_string(string:, loan_application_id:)
    tokens = string.split(" ")
    self.new(loan_application_id, tokens[1], tokens[2])
  end
end