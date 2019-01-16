# Elasticsearch

This repository contains Ruby integrations for [Elasticsearch](http://elasticsearch.org):

* a client for connecting to an Elasticsearch cluster,
* a Ruby API for the Elasticsearch's REST API,
* various extensions and utilities.

For integration with Ruby models and Rails applications,
see the <https://github.com/onemedical/elasticsearch-rails> project.

## Compatibility

The libraries are compatible with Ruby 1.8.7 and higher.

The library is compatible with Elasticsearch 0.90, 1.x and 2.x -- you have to install and use a matching version, though.

The 1.x versions and the master branch are compatible with Elasticsearch 1.x and 2.x APIs.

To use the **Elasticsearch 0.90** API, install the **0.4.x** gem version or use the corresponding
[`0.4`](https://github.com/elasticsearch/elasticsearch-ruby/tree/0.4) branch.

## Installation

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'elasticsearch-v2', git: 'git://github.com/onemedical/elasticsearch-ruby.git'

## Usage

The [`elasticsearch-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-v2)
library is a wrapper for two separate libraries:

* [`elasticsearch-transport-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-transport-v2),
  which provides a low-level Ruby client for connecting to an [Elasticsearch](http://elasticsearch.org) cluster
* [`elasticsearch-api-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-api-v2),
  which provides a Ruby API for the Elasticsearch RESTful API

```ruby
require 'elasticsearch_v2'

client = ElasticsearchV2::Client.new log: true

client.transport.reload_connections!

client.cluster.health

client.search q: 'test'

# etc.
```

Both of these libraries are extensively documented.
**Please read the [`elasticsearch-transport`](http://rubydoc.info/gems/elasticsearch-transport)
and the [`elasticsearch-api`](http://rubydoc.info/gems/elasticsearch-api) documentation carefully.**

_Keep in mind, that for optimal performance, you should use a HTTP library which supports persistent
("keep-alive") connections, e.g. [Patron](https://github.com/toland/patron) or
[Typhoeus](https://github.com/typhoeus/typhoeus)._

This repository contains these additional Ruby libraries:

* [`elasticsearch-extensions-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-extensions-v2),
   which provides a set of extensions to the base library,
* [`elasticsearch-dsl-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-dsl-v2),
  which provides a Ruby API for the [Elasticsearch Query DSL](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/query-dsl.html),
* [`elasticsearch-watcher-v2`](https://github.com/onemedical/elasticsearch-ruby/tree/onemedical/es2namespace/elasticsearch-watcher-v2),
  which provides Ruby API for the [_Watcher_](https://www.elastic.co/products/watcher) plugin.

Please see their respective READMEs for information and documentation.

## Development

[![Build Status](https://travis-ci.org/elastic/elasticsearch-ruby.svg?branch=master)](https://travis-ci.org/elastic/elasticsearch-ruby) [![Code Climate](https://codeclimate.com/github/elastic/elasticsearch-ruby/badges/gpa.svg)](https://codeclimate.com/github/elastic/elasticsearch-ruby)

To work on the code, clone and bootstrap the project first:

```
git clone https://github.com/onemedical/elasticsearch-ruby.git
cd elasticsearch-ruby/
rake setup
rake bundle
```

This will clone the Elasticsearch repository into the project, and run `bundle install` in all subprojects.

To run tests, you need to start a testing cluster on port 9250,
or provide a different one in the `TEST_CLUSTER_PORT` environment variable.

There's a Rake task to start the testing cluster:

```
rake test:cluster:start
```

You can configure the port, path to the startup script,
number of nodes, and other settings with environment variables:

```
TEST_CLUSTER_COMMAND=./tmp/builds/elasticsearch-2.0.0-SNAPSHOT/bin/elasticsearch \
TEST_CLUSTER_PORT=9250 \
TEST_CLUSTER_NODES=2 \
TEST_CLUSTER_NAME=my_cluster \
TEST_CLUSTER_PARAMS='-Xms500m -Xmx500m -D es.index.store.type=niofs' \
TEST_CLUSTER_TIMEOUT=120 \
rake test:cluster:start
```

To run tests against unreleased Elasticsearch versions, you can use the `rake elasticsearch:build`
Rake task to build Elasticsearch from the cloned source
(use `rake elasticsearch:update` to update the repository):

**Note:** If you have gems from the `elasticsearch` family installed system-wide,
          and want to use development ones, prepend the command with `bundle exec`.

```
rake elasticsearch:build
```

You can pass a branch name (tag, commit, ...) as the Rake task variable:

```
rake elasticsearch:build[origin/1.x]
```

To run all the tests in all the subprojects, use the Rake task:

```
time rake test:all
```

## License

This software is licensed under the Apache 2 license, quoted below.

    Copyright (c) 2013 Elasticsearch <http://www.elasticsearch.org>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
