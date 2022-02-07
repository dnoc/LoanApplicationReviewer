class ApplicationDecision < ActiveRecord::Base
  belongs_to :application

  attr_reader :approved, :dti, :credit_score

  validates_presence_of :dti, :credit_score

  def initialize(application_id:, dti:, credit_score:)
    @application_id = application_id
    @dti = dti
    @credit_score = credit_score
    @approved = _make_approval_decision
  end

  private

  def _make_approval_decision
    @dti < BigDecimal("0.5") && @credit_score > 620
  end
end