require "rspec/permutations/permutation"

RSpec.describe RSpec::Permutations::Permutation do
  describe "#to_s" do
    it "converts the key/value pairs to a human-readable string" do
      permutation = described_class.new("testing")
      permutation["key"] = "value"
      permutation["key 2"] = "value 2"
      expect(permutation.to_s).to eq("key: value, key 2: value 2")
    end
  end
end
