class Income < ActiveRecord::Base
  SCHEMA_NAME = "INCOME".freeze

  belongs_to :application

  attr_accessor :name, :kind, :monthly_amount

  validates_presence_of :name, :kind, :monthly_amount

  def initialize(application_id:, name:, kind:, monthly_amount:)
    @application_id = application_id
    @name = name
    @kind = kind
    @monthly_amount = monthly_amount
  end
end