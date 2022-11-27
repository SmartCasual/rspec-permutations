require_relative "loader"

module RSpec
  module Permutations
    module Hook
      def permutations(name = nil, &block)
        Loader.new(name).permutations.each do |permutation|
          context("with permutation #{permutation}") do
            permutation.each do |key, value|
              let(key.to_sym) { instance_eval(value) }
            end

            instance_eval(&block)
          end
        end
      end
    end
  end
end
