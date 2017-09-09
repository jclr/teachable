require 'faraday'
require 'json'

module Teachable
  class Client

    def self.get(path)
      conn = Faraday.new(url: Teachable::API_URL)
      resp = conn.get do |req|
        req.url(path)
        req.headers['Content-Type'] = 'application/json'
      end

      self.handle_response(resp)
    end

    def self.post(path, body)
      conn = Faraday.new(url: Teachable::API_URL)
      resp = conn.post do |req|
        req.url(path)
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.body = body.to_json
      end

      self.handle_response(resp)
    end

    def self.delete(path)
      conn = Faraday.new(url: Teachable::API_URL)
      resp = conn.delete do |req|
        req.url(path)
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
      end

      self.handle_response(resp)
    end

    def self.handle_response(response)
      body = JSON.parse(response.body, symbolize_keys: true, symbolize_names: true) unless response.body.empty?
      case response.status.to_s
      when /^2/
        body
      when '401'
        raise Unauthorized.new(body[:errors])
      when '404'
        raise NotFound.new(body[:errors])
      when /^4/
        raise BadRequest.new(body[:errors])
      when /^5/
        raise InternalServiceError.new(body[:errors])
      else
        raise APIUnreachableError
      end
    end
  end

  class BadRequest < StandardError; end
  class Unauthorized < StandardError; end
  class NotFound < StandardError; end
  class InternalServiceError < StandardError; end
  class APIUnreachableError < StandardError; end
end
