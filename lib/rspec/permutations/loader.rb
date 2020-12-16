require_relative "spec_finder"
require_relative "parser"

class RSpec::Permutations::Loader
  def initialize(name)
    @name = name
  end

  def permutations
    spec_file = RSpec::Permutations::SpecFinder.find
    RSpec::Permutations::Parser.new(spec_file).permutations(@name)
  end
end
