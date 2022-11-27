=begin some permutations
| testing | testing2 |
| 1       | 1        |
| "fj"    | "fj"     |
| "abc"   | "abc"    |
=end

=begin other permutations
| jfkn | testing21 |
| 1    | "two"     |
=end

=begin Strings
| string |
| "abc"  |
=end

=begin Numbers
| number |
| 1      |
=end

=begin Booleans
| boolean |
| true    |
=end

=begin Arrays
| array      |
| [1, "abc"] |
=end

=begin Hashes
| hash   |
| {a: 1} |
=end

=begin Methods
| example_method | method_invocation |
| "test"         | example_method    |
=end

require "rspec/permutations"

RSpec.describe RSpec::Permutations do
  permutations "some permutations" do
    it "is equal" do
      expect(testing).to eq(testing2)
    end
  end

  permutations "other permutations" do
    it "is not equal" do
      expect(jfkn).not_to eq(testing21)
    end
  end

  permutations "Strings" do
    it "behaves predictably with strings" do
      expect(string).to eq("abc")
    end
  end

  permutations "Numbers" do
    it "behaves predictably with numbers" do
      expect(number).to eq(1)
    end
  end

  permutations "Booleans" do
    it "behaves predictably with booleans" do
      expect(boolean).to eq(true)
    end
  end

  permutations "Arrays" do
    it "behaves predictably with arrays" do
      expect(array).to eq([1, "abc"])
    end
  end

  permutations "Hashes" do
    it "behaves predictably with hashes" do
      expect(hash).to eq({a: 1})
    end
  end

  permutations "Methods" do
    it "correctly chains methods" do
      expect(method_invocation).to eq("test")
    end
  end
end
