class ApplicationDecision < ActiveRecord::Base
  belongs_to :loan_application

  attr_reader :approved, :dti, :credit_score

  validates_presence_of :dti, :credit_score

  def initialize(loan_application_id:, dti:, credit_score:)
    @loan_application_id = loan_application_id
    @dti = dti
    @credit_score = credit_score
    @approved = _is_approved?
  end

  private

  def _is_approved?
    @dti < BigDecimal("0.5") && @credit_score > 620
  end
end