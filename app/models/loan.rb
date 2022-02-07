class Loan < ActiveRecord::Base
  belongs_to :application

  attr_accessor :principal_amount, :years, :rate, :monthly_payment

  validates_presence_of :principal_amount, :years, :rate, :monthly_payment

  def initialize(application_id:, principal_amount:, years:, rate:, monthly_payment:)
    @application_id = application_id
    @principal_amount = principal_amount
    @years = years
    @rate = rate
    @monthly_payment = monthly_payment
end