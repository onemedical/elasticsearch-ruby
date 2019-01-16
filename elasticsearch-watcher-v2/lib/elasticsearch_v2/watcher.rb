require "elasticsearch_v2/watcher/version"

Dir[ File.expand_path('../watcher/api/actions/**/*.rb', __FILE__) ].each   { |f| require f }

module ElasticsearchV2
  module Watcher
    def self.included(base)
      base.__send__ :include, ElasticsearchV2::API::Watcher
    end
  end
end

module ElasticsearchV2
  module API
    module Watcher
      module Actions; end

        # Client for the "watcher" namespace (includes the {Watcher::Actions} methods)
        #
        class WatcherClient
          include ElasticsearchV2::API::Common::Client,
                  ElasticsearchV2::API::Common::Client::Base,
                  ElasticsearchV2::API::Watcher::Actions
        end

        # Proxy method for {WatcherClient}, available in the receiving object
        #
        def watcher
          @watcher ||= WatcherClient.new(self)
        end
    end
  end
end

ElasticsearchV2::API.__send__ :include, ElasticsearchV2::API::Watcher

ElasticsearchV2::Transport::Client.__send__ :include, ElasticsearchV2::API::Watcher if defined?(ElasticsearchV2::Transport::Client)
