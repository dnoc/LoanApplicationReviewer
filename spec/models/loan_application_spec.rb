require "rails_helper"

RSpec.describe LoanApplication do
  describe "#credit_score" do
    let(:loan_application) { described_class.new(provided_id: "test") }

    before(:all) do
      loan_application.save
    end

    after(:all) do
      loan_application.delete
    end

    before do
      borrower1.save!
      borrower2.save!
    end

    before do
      borrower1.save!
      borrower2.save!
    end

    let(:borrower1) { Borrower.new(loan_application_id: loan_application.id, name: "Brent", credit_score: 500) }

    describe "when one score is lower" do
      let(:borrower2) { Borrower.new(loan_application_id: loan_application.id, name: "Daphne", credit_score: 750) }

      it "picks the lowest score" do
        expect(loan_application.credit_score).to eq(borrower1.credit_score)
      end
    end

    describe "when the scores are equal" do
      let(:borrower2) { Borrower.new(loan_application_id: loan_application.id, name: "Daphne", credit_score: 500) }

      it "picks the equal lowest score" do
        expect(loan_application.credit_score).to eq(borrower1.credit_score)
        expect(loan_application.credit_score).to eq(borrower2.credit_score)
      end
    end
  end

  describe "#dti" do
    let(:loan_application) { described_class.new(provided_id: "test") }

    before(:all) do
      loan_application.save
    end

    after(:all) do
      loan_application.delete
    end

    before do
      # loans and liabilities
    end

    before do
      # loans and liabilities
    end

    describe "happy path" do
      it "calculates dti" do
        
      end
    end

    describe "when there are no liabilities" do
      it "calculates dti" do
        
      end
    end

    describe "when no liabilities are applicable" do
      it "calculates dti" do
        
      end
    end

    describe "when there are multiple loans" do
      it "calculates dti" do
        
      end
    end

    describe "when there is one income" do
      it "calculates dti" do
        
      end
    end
  end
end