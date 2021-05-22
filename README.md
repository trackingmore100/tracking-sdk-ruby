Trackingmore-Ruby-sdk
=================

The Ruby SDK of Trackingmore API
## Official document

[Document](https://www.trackingmore.com/v3/api-index)

##Init

```ruby
require "#{File.dirname(__FILE__)}/tracking.rb"
api_key = 'Your api key'
tracker = Tracking.new(api_key)
```

Quick Start
--------------
- Put your ApiKey in the constructor of the Tracking class
- All returns are in Json format.
- After instantiating the Tracking class, you can use its interface methods
- Most Api params receive multiple tracking numbers

**Get a list of the couriers in Trackingmore**

	result = tracker.doRequest('courier')
    print("#{result}\n")

**Detect which couriers defined in your account match a tracking number**

	post = { "tracking_number": 'EA152563254CN' }
    result = tracker.doRequest('detect', post, 'POST')
    print("#{result}\n")


**Post trackings to your account**

    //Create single tracking numbers
    post_data  = {"tracking_number": "EA152563254CN", "courier": "china-ems"}
    //Create multiple tracking numbers
    postData = [{"tracking_number": "EA152563254CN", "courier": "china-ems"}, {"tracking_number": "EA152563254CN", "courier": "china-ems"}]
    result = tracker.doRequest('create', post_data, 'POST')
    print("#{result}\n")

**Summary of Connection API Methods with all the api and Methods**

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

## Typical Server Responses

We will respond with one of the following status codes.

Code|Type | Message
----|--------------|-------------------------------
200    | <code>Success</code>|    Request response is successful
203    | <code>PaymentRequired</code>|  API service is only available for paid account Please subscribe paid plan to unlock API services                                                             ul
204    | <code>No Content</code>|    Request was successful, but no data returned Tracking NO. or target data possibly do not exist
400    | <code>Bad Request</code>| Request type error Please check the API documentation for the request type of this API
401    | <code>Unauthorized</code>|    Authentication failed or has no permission Please check and ensure your API Key is correct
403    | <code>Bad Request</code>|    Page does not exist Please check and ensure your link is correct                                                                                             ul
404    | <code>Not Found</code>|    Page does not exist Please check and ensure your link is correct
408    | <code>Time Out</code>|    Request timeout The official website did not return data, please try again later
411    | <code>Bad Request</code>|    Specified request parameter length exceeds length limit Please check and ensure that the request parameters are of the required length
412    | <code>Bad Request</code>|    Specified request parameter format doesn't meet requirements Please check and ensure that the request parameters are in the required format
413    | <code>Out limited</code>|    The number of request parameters exceeds the limit Please check the API documentation for the limit of this API
417    | <code>Bad Request</code>|    Missing request parameters or request parameters cannot be parsed Please check and ensure that the request parameters are complete and correctly formatted
421    | <code>Bad Request</code>|    Some of required parameters are empty Some couriers need special parameters to track logistics information (Special Couriers)
422    | <code>Bad Request</code>|    Unidentifiable courier code Please check and ensure that the courier code are correct(Courier code)
423    | <code>Bad Request</code>|    Tracking No. already exists
424    | <code>Bad Request</code>|    Tracking No. no exists Please use 「Create trckings」 API first to create trackings
429    | <code>Bad Request</code>|    Exceeded API request limits, please try again later Please check the API documentation for the limit of this API
511    | <code>Server Error</code>|    Server error Please contact us: service@trackingmore.org.
512    | <code>Server Error</code>|    Server error Please contact us: service@trackingmore.org.
513    | <code>Server Error</code>|    Server error Please contact us: service@trackingmore.org.        