require 'test_helper'

class ElasticsearchV2::Transport::Transport::SerializerTest < Test::Unit::TestCase

  context "Serializer" do

    should "use MultiJson by default" do
      ::MultiJson.expects(:load)
      ::MultiJson.expects(:dump)
      ElasticsearchV2::Transport::Transport::Serializer::MultiJson.new.load('{}')
      ElasticsearchV2::Transport::Transport::Serializer::MultiJson.new.dump({})
    end

  end

end
