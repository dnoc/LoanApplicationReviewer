class Application < ActiveRecord::Base
  SCHEMA_NAME = "APPLICATION".freeze

  has_many :borrowers
  has_many :incomes
  has_many :liabilities
  has_many :loans
  has_many :decisions

  attr_accessor :provided_id

  validates_presence_of :provided_id
  validates :borrowers, length: { maximum: 2 }

  def initialize(provided_id:)
    @provided_id = provided_id
  end
end