#!/usr/bin/ruby -w
# frozen_string_literal: true
require "#{File.dirname(__FILE__)}/tracking.rb"
api_key = 'Your api key'
tracker = Tracking.new(api_key)

# Get realtime tracking results of a single tracking
post = { "tracking_number": 'EA152563254CN', "courier": 'china-ems' }
result = tracker.doRequest('realtime', post, 'POST')
print("#{result}\n")

# #count
# count = 'count?courier=1&limit=100&created_at_min=1521314361&created_at_max=1541314361'
# result = tracker.doRequest(count)
# print("#{result}\n")
#

# # Get tracking results of a  tracking or List all trackings
# get = 'get?page=1&limit=100&created_at_min=1521314361&created_at_max=1541314361'
# result = tracker.doRequest(get)
# print("#{result}\n")

# post_data = [{ "tracking_number": 'EA152563254CN', "courier": 'china-ems' }, { "tracking_number": 'EA152563254CN', "courier": 'china-ems' }]
# # Update Tracking item
# result = tracker.doRequest('modifycourier', post_data, 'PUT')
# print("#{result}\n")
#
# # archive
# result = tracker.doRequest('archive', post_data, 'POST')
# print("#{result}\n")
#
# # Delete tracking item
# result = tracker.doRequest('delete', post_data, 'DELETE')
# print("#{result}\n")
#
# # create  tracking number
# result = tracker.doRequest('create', post_data, 'POST')
# print("#{result}\n")
#
# # manual update
# result = tracker.doRequest('manualupdate', post_data, 'POST')
# print("#{result}\n")
#
# # remote tracking
# result = tracker.doRequest('remote', post_data, 'POST')
# print("#{result}\n")
#
# # Get cost time iterm results
# result = tracker.doRequest('transittime', post_data, 'POST')
# print("#{result}\n")
#
# # detect a carriers by tracking number
# post = { "tracking_number": 'EA152563254CN' }
# result = tracker.doRequest('detect', post, 'POST')
# print("#{result}\n")
#
# # get all carriers
# result = tracker.doRequest('courier')
# print("#{result}\n")
#
# # Get status number
# status = 'status?tracking_number=EA152563254CN'
# result = tracker.doRequest(status)
# print("#{result}\n")
#
# # Set number not update
# result = tracker.doRequest('notupdate', post_data, 'POST')
# print("#{result}\n")
#
# # Modify courier code
# post = { "tracking_number": 'EA152563254CN', "courier": 'china-ems', "new_express": 'china-post' }
# result = tracker.doRequest('modifycourier', post, 'PUT')
# print("#{result}\n")
#
# # Get user info
# result = tracker.doRequest('userinfo')
# print("#{result}\n")
#
# # air real time track
# result = tracker.doRequest('aircargo', post_data, 'POST')
# print("#{result}\n")
