module RSpec
  module Permutations
    class Permutation < Hash
      def to_s
        map { |key, value| "#{key}: #{value}" }.join(", ")
      end
    end
  end
end
