require 'net/http'
require 'uri'
require 'json'

require File.dirname(__FILE__) + '/../capistrano-http-notify' if !defined?(CapistranoHttpNotify)

CapistranoHttpNotify.with_configuration do
  namespace :deploy do
    def perform_json_post(uri, body)
      req = new_json_post uri, body
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        res = http.request req
        yield req, res if block_given?
        res
      end
    end

    def new_json_post(uri, body)
      req = Net::HTTP::Post.new(uri.path.size == 0 ? '/' : uri.path, 'Content-Type' => 'application/json')
      req.body = body.to_json
      req
    end

    task :deploy_notification_via_http do
      perform_json_post URI(http_notify_options[:url]), {
        application: application,
        user: `git config --get github.user`.strip,
        stage: stage,
        branch: branch
      }
    end
  end

  after 'deploy:restart', 'deploy:deploy_notification_via_http'
end