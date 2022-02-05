class Income < ActiveRecord::Base
  belongs_to :loan_application

  attr_accessor :name, :kind, :monthly_amount
end