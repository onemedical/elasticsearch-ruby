require "elasticsearch_v2/version"

require 'elasticsearch_v2/transport'
require 'elasticsearch_v2/api'

module ElasticsearchV2
  module Transport
    class Client
      include ElasticsearchV2::API
    end
  end
end
