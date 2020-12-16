module RSpec::Permutations::SpecFinder
  def self.find
    caller_locations.find { |l| l.path.end_with?("_spec.rb") }.absolute_path
  end
end
