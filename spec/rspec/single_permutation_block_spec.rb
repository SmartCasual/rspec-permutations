=begin
| testing | testing2 |
| 1       | 1        |
| "fj"    | "fj"     |
=end

require "rspec/permutations"

RSpec.describe "A single permutation block" do
  permutations do
    it "is equal" do
      expect(testing).to eq(testing2)
    end
  end
end
