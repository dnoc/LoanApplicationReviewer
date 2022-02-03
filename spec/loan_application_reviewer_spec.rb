describe LoanApplicationReviewer do
  describe "#review" do
    subject { described_class.review(file) }

    let(:file) { File.new(path, "r")}
    let(:path) { "input.txt" }

    it { is_expected.to be(path) }
  end
end