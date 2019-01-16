require 'elasticsearch_v2/extensions/test/cluster'

namespace :elasticsearch do
  desc "Start Elasticsearch cluster for tests"
  task :start do
    ElasticsearchV2::Extensions::Test::Cluster.start
  end

  desc "Stop Elasticsearch cluster for tests"
  task :stop do
    ElasticsearchV2::Extensions::Test::Cluster.stop
  end
end
