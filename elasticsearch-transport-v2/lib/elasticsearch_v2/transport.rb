require "uri"
require "time"
require "timeout"
require "multi_json"
require "faraday"

require "elasticsearch_v2/transport/transport/serializer/multi_json"
require "elasticsearch_v2/transport/transport/sniffer"
require "elasticsearch_v2/transport/transport/response"
require "elasticsearch_v2/transport/transport/errors"
require "elasticsearch_v2/transport/transport/base"
require "elasticsearch_v2/transport/transport/connections/selector"
require "elasticsearch_v2/transport/transport/connections/connection"
require "elasticsearch_v2/transport/transport/connections/collection"
require "elasticsearch_v2/transport/transport/http/faraday"
require "elasticsearch_v2/transport/client"

require "elasticsearch_v2/transport/version"

module ElasticsearchV2
  module Client

    # A convenience wrapper for {::ElasticsearchV2::Transport::Client#initialize}.
    #
    def new(arguments={}, &block)
      ElasticsearchV2::Transport::Client.new(arguments, &block)
    end
    extend self
  end
end
