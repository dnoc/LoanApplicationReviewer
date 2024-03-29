require "rails_helper"

RSpec.describe ApplicationReviewService do
  describe "#review" do
    subject { described_class.review(file: file) }

    let(:file) { File.new(path, "r")}
    let(:path) { "input.txt" }

    it { is_expected.to eq(path) }
  end
end