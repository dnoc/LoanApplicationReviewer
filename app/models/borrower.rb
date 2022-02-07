class Borrower < ActiveRecord::Base
  SCHEMA_NAME = "BORROWER".freeze
  COBORROWER_SCHEMA_NAME = "COBORROWER".freeze

  belongs_to :application

  attr_accessor :name, :credit_score

  validates_presence_of :name, :credit_score

  def initialize(application_id:, name:, credit_score:)
    @application_id = application_id
    @name = name
    @credit_score = credit_score
  end
end