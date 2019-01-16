require 'test_helper'

module ElasticsearchV2
  module Test
    module Aggregations
      class SumTest < ::Test::Unit::TestCase
        include ElasticsearchV2::DSL::Search::Aggregations

        context "Sum agg" do
          subject { Sum.new }

          should "be converted to a Hash" do
            assert_equal({ sum: {} }, subject.to_hash)
          end

          should "take a Hash" do
            subject = Sum.new foo: 'bar'
            assert_equal({ sum: { foo: 'bar' } }, subject.to_hash)
          end
        end
      end
    end
  end
end
