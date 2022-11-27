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
            PermutationBlock.new(table, name: name)
          end
      end

      class PermutationBlock
        def initialize(table, name: nil)
          @name = name
          @permutations = Table.parse(table)
        end

        attr_reader :name, :permutations
      end

      class Table
        class << self
          def parse(raw_table)
            headers_row, *value_rows = raw_table.strip.split("\n")
            headers = split_row(headers_row)

            value_rows.map do |value_row|
              values = split_row(value_row)

              headers.each.with_object(Permutation.new).with_index do |(header, hash), index|
                hash[header] = values[index]
              end
            end
          end

          private

          def blank?(string)
            string.nil? || string == ""
          end

          def split_row(row)
            row
              .strip
              .split("|")
              .map(&:strip)
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
