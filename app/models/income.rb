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

  def self.build_from_string(string:, application_id:)
    tokens = string.split(" ")
    Income.new(application_id: application_id, name: tokens[1], kind: tokens[2], monthly_amount: tokens[3])
  end
end