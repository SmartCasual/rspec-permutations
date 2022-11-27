module RSpec
  module Permutations
    module SpecFinder
      def self.find
        caller_locations.find { |l| l.path.end_with?("_spec.rb") }.absolute_path
      end
    end
  end
end
