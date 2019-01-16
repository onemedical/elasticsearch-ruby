require 'test_helper'

module ElasticsearchV2
  module Test
    class SortingIntegrationTest < ::ElasticsearchV2::Test::IntegrationTestCase
      include ElasticsearchV2::DSL::Search

      context "Sorting integration" do
        startup do
          ElasticsearchV2::Extensions::Test::Cluster.start(nodes: 1) if ENV['SERVER'] and not ElasticsearchV2::Extensions::Test::Cluster.running?
        end

        setup do
          @client.indices.create index: 'test'
          @client.index index: 'test', type: 'd', id: '1', body: { tags: ['one'], clicks: 5 }
          @client.index index: 'test', type: 'd', id: '2', body: { tags: ['one', 'two'], clicks: 15 }
          @client.index index: 'test', type: 'd', id: '3', body: { tags: ['one', 'three'], clicks: 20 }
          @client.indices.refresh index: 'test'
        end

        context "sorting by clicks" do
          should "return documents in order" do
            response = @client.search index: 'test', body: search {
              sort do
                by :clicks, order: 'desc'
              end
            }.to_hash

            assert_same_elements ['3', '2', '1'], response['hits']['hits'].map { |d| d['_id'] }
          end
        end

      end
    end
  end
end
