require 'jwt'
module Requests
  module JsonHelpers
    def json_data
      @response_json ||= JSON.parse(response.body)
    end
  end

  module HeaderHelpers
    define_method("get_request") do |&block|
      headers = env || @headers || {}
      __send__("get", path, params, json_headers.merge(headers), &block)
    end

    %w(post_request put_request delete_request).each do |method_name|
      define_method("#{method_name}") do |&block|
        headers = env || @headers || {}
        method_name.slice!(/_request/)
        __send__(method_name, path, params.to_json, json_headers.merge(headers), &block)
      end
    end

    def json_headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'Host' => 'api.example.com',
      }
    end

  end
end
