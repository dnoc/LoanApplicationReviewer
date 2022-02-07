class Liability < ActiveRecord::Base
  SCHEMA_NAME = "LIABILITY".freeze

  belongs_to :application

  attr_accessor :comma_separated_names, :kind, :monthly_payment, :outstanding_balance

  validates_presence_of :comma_separated_names, :kind, :monthly_amount, :outstanding_balance

  def initialize(application_id:, comma_separated_names:, kind:, monthly_amount:, outstanding_balance:)
    @application_id = application_id
    @comma_separated_names = comma_separated_names
    @kind = kind
    @monthly_amount = monthly_amount
    @outstanding_balance = outstanding_balance
  end
end