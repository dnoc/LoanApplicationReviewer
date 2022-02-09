class Liability < ActiveRecord::Base
  SCHEMA_NAME = "LIABILITY".freeze
  MIN_APPLICABLE_PAYMENTS = 10.freeze

  belongs_to :application

  attr_accessor :comma_separated_names, :kind, :monthly_payment, :outstanding_balance

  validates_presence_of :comma_separated_names, :kind, :monthly_payment, :outstanding_balance

  def initialize(application_id:, comma_separated_names:, kind:, monthly_payment:, outstanding_balance:)
    @application_id = application_id
    @comma_separated_names = comma_separated_names
    @kind = kind
    @monthly_payment = monthly_payment
    @outstanding_balance = outstanding_balance
  end

  def self.build_from_string(string:, application_id:)
    tokens = string.split(" ")
    Liability.new(
      application_id: application_id,
      comma_separated_names: tokens[1],
      kind: tokens[2],
      monthly_payment: tokens[3],
      outstanding_balance: tokens[4]
    )
  end

  def applicable_to_dti?
    outstanding_balance / monthly_payment > MIN_APPLICABLE_PAYMENTS
  end
end