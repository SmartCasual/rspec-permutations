# Rspec::Permutations 1.0.0

[![SmartCasual](https://circleci.com/gh/SmartCasual/rspec-permutations.svg?style=svg)](https://app.circleci.com/pipelines/github/SmartCasual/rspec-permutations)

RSpec::Permutations is a gem that provides a simple way to run your RSpec tests with different permutations of parameters.

This makes combinatorial unit testing faster to write and easier to read.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rspec-permutations"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-permutations

## Usage

Define a permutation group in your spec file, then use the `permutations` method to run your tests once for each permutation:

```ruby
=begin
| a     | b     | result   |
| 1     | 2     | 3        |
| 2.0   | 3     | 5.0      |
| "car" | "pet" | "carpet" |
=end

RSpec.describe "An example with the + method" do
  permutations do
    it "combines `a` and `b`" do
      expect(a + b).to eq(result)
    end
  end
end
```

This would be the equivalent to writing:

```ruby
RSpec.describe "An example with the + method" do
  context "with permutation a: 1, b: 2, result: 3" do
    let(:a) { 1 }
    let(:b) { 2 }
    let(:result) { 3 }

    it "combines `a` and `b`" do
      expect(a + b).to eq(result)
    end
  end

  context "with permutation a: 2.0, b: 3, result: 5.0" do
    let(:a) { 2.0 }
    let(:b) { 3 }
    let(:result) { 5.0 }

    it "combines `a` and `b`" do
      expect(a + b).to eq(result)
    end
  end

  context "with permutation a: 'car', b: 'pet', result: 'carpet'" do
    let(:a) { "car" }
    let(:b) { "pet" }
    let(:result) { "carpet" }

    it "combines `a` and `b`" do
      expect(a + b).to eq(result)
    end
  end
end
```

### Multiple permutation blocks

You can define multiple permutation blocks in a single spec file, then use the `permutations` method to run your tests once for each permutation, giving the permutation block's name:

```ruby
=begin First permutation group
| a | b | c        |
| 1 | 2 | "apple"  |
| 2 | 3 | "banana" |
=end

=begin Second permutation group
| d | e            |
| 5 | {a: 1, b: 2} |
| 2 | 3            |
=end

RSpec.describe SomeClass do
  permutations "First permutation group" do
    it "does something" do
      # a, b, and c are available here
    end
  end

  permutations "Second permutation group" do
    it "does something else" do
      # d and e are available here
    end
  end
end
```

Your blocks can be named however you like.

See `spec/rspec/permutations_spec.rb` for more examples.

### Rubocop

Rubocop will complain about the `=begin` and `=end` comments. You may want to disable it for spec files:

```yaml
# .rubocop.yml
Style/BlockComments:
  Exclude:
    - spec/**/*
```

## Development

The instructions in this section were added when the gem was generated, please let me know if any of them are incorrect.

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SmartCasual/rspec-permutations/pulls.
