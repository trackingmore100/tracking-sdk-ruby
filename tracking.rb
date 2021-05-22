#!/usr/bin/ruby -w
#coding=utf-8

class Tracking
  require 'uri'
  require 'net/http'
  require 'net/https'
  require 'json'
  @@api_version = 'v3'
  @@base_path = 'https://api.trackingmore.com/'
  @@api_key = 'Your api key'

  def initialize(api_key)
    @@api_key = api_key
  end

  def doRequest(url, post_data = '', method = 'get')
    print("#{url}\n")
    method = method.upcase
    headers = { 'Content-Type' => 'application/json', 'Tracking-Api-Key': @@api_key }
    url = "#{@@base_path}#{@@api_version}/trackings/#{url}"
    @to_send = if post_data.empty?
                 ''
               else
                 post_data.to_json
               end
    uri = URI.parse(url)
    print("#{post_data}\n")
    https = Net::HTTP.new(uri.host, uri.port)
    if uri.scheme == 'https'
      https.use_ssl = true
      https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    case method
    when 'GET'
      req = Net::HTTP::Get.new(uri.path, headers)
    when 'POST'
      req = Net::HTTP::Post.new(uri.path, headers)
    when 'DELETE'
      req = Net::HTTP::Delete.new(uri.path, headers)
    when 'PUT'
      req = Net::HTTP::Put.new(uri.path, headers)
    else
      return puts 'parameter method is wrong!'
    end

    req.body = @to_send.to_s
    res = https.request(req)
    res.body
  end
end

	