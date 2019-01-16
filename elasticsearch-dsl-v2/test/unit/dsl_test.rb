require 'test_helper'

module ElasticsearchV2
  module Test
    class DSLTest < ::Test::Unit::TestCase
      context "The DSL" do
        class DummyDSLReceiver
          include ElasticsearchV2::DSL
        end

        should "include the module in receiver" do
          assert_contains DummyDSLReceiver.included_modules, ElasticsearchV2::DSL
          assert_contains DummyDSLReceiver.included_modules, ElasticsearchV2::DSL::Search
        end
      end
    end
  end
end
