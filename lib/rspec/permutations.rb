require_relative "permutations/version"

module RSpec
  module Permutations
    require_relative "permutations/hook"

    RSpec.configure do |config|
      config.extend(RSpec::Permutations::Hook)
    end

    class Error < StandardError; end
  end
end
