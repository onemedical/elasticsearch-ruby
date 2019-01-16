# encoding: utf-8

require 'elasticsearch_v2/extensions'

require 'ansi'
require 'ansi/table'
require 'ansi/terminal'

require 'delegate'
require 'elasticsearch_v2/transport/transport/response'

require 'elasticsearch_v2/extensions/ansi/helpers'
require 'elasticsearch_v2/extensions/ansi/actions'
require 'elasticsearch_v2/extensions/ansi/response'

module ElasticsearchV2
  module Extensions

    # This extension provides a {ResponseBody#to_ansi} method for the Elasticsearch response body,
    # which colorizes and formats the output with the `ansi` gem.
    #
    # @example Display formatted search results
    #
    #     require 'elasticsearch_v2/extensions/ansi'
    #     puts ElasticsearchV2::Client.new.search.to_ansi
    #
    # @example Display a table with the output of the `_analyze` API
    #
    #     require 'elasticsearch_v2/extensions/ansi'
    #     puts ElasticsearchV2::Client.new.indices.analyze(text: 'Quick Brown Fox Jumped').to_ansi
    #
    module ANSI
    end

  end
end
