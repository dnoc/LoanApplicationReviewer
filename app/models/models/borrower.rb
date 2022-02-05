class Borrower < ActiveRecord::Base
  belongs_to :loan_application

  attr_accessor :name, :credit_score
end