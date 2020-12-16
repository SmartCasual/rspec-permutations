=begin blah
| testing | testing2 |
| 1       | 1        |
| fj      | fj       |
| abc     | xyz      |
=end

=begin blah3
| jfkn | testing21 |
| 1    | two       |
=end

require "rspec/permutations"

RSpec.describe "thing" do
  permutations "blah" do
    it "is equal" do
      expect(testing).to eq(testing2)
    end
  end
end
