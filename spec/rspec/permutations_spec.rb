=begin equality
| testing | testing2 |
| 1       | 1        |
| fj      | fj       |
| abc     | abc      |
=end

=begin inequality
| jfkn | testing21 |
| 1    | two       |
=end

require "rspec/permutations"

RSpec.describe RSpec::Permutations do
  permutations "equality" do
    it "is equal" do
      expect(testing).to eq(testing2)
    end
  end

  permutations "inequality" do
    it "is not equal" do
      expect(jfkn).not_to eq(testing21)
    end
  end
end
