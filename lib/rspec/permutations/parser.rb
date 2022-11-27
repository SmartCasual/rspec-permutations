require_relative "permutation"

module RSpec
  module Permutations
    class Parser
      def initialize(spec_file)
        @spec_file = spec_file
      end

      def permutations(name = nil)
        if name
          permutation_blocks.find { |pb| pb.name == name }.permutations
        else
          permutation_blocks.first.permutations
        end
      end

      private

      def permutation_blocks
        @permutation_blocks ||= File.read(@spec_file)
          .scan(/^=begin(?:[[:blank:]]+([^\n]+))?\n(.*?)=end$/m)
          .map do |name, table|
            PermutationBlock.new(name, table)
          end
      end

      class PermutationBlock
        def initialize(name = nil, table)
          @name = name
          @permutations = Table.parse(table)
        end

        attr_reader :name, :permutations
      end

      class Table
        class << self
          def parse(raw_table)
            headers, *rows = raw_table.strip.split("\n")
            headers = headers.strip.split("|").map(&:strip)
            headers = strip_start_and_end_blanks(headers)

            rows.map do |row|
              values = row.strip.split("|").compact.map(&:strip)
              values = strip_start_and_end_blanks(values)

              headers.each.with_object(Permutation.new(row)).with_index do |(header, hash), index|
                hash[header] = values[index]
              end
            end
          end

          private

          def blank?(string)
            string.nil? || string == ""
          end

          def strip_start_and_end_blanks(array)
            array
              .drop_while { |s| blank?(s) }
              .reverse
              .drop_while { |s| blank?(s) }
              .reverse
          end
        end
      end
    end
  end
end
