require 'test_helper'

module ElasticsearchV2
  module Test
    class WrapperGemTest < ::Test::Unit::TestCase

      context "Wrapper gem" do

        should "require all neccessary subgems" do
          assert defined? ElasticsearchV2::Client
          assert defined? ElasticsearchV2::API
        end

        should "mix the API into the client" do
          client = ElasticsearchV2::Client.new

          assert_respond_to client, :search
          assert_respond_to client, :cluster
          assert_respond_to client, :indices
        end

      end

    end
  end
end
