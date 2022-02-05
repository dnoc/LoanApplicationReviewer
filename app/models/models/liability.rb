class Liability < ActiveRecord::Base
  belongs_to :loan_application

  attr_accessor :comma_separated_names, :kind, :monthly_payment, :outstanding_balance
end