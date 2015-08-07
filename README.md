# IonicPush

IonicPush is a Ruby gem that provides a simple to use interface with Ionic.io's Push Notification service. Work on this is on-going, however the current version available works completely.

## Installation

Add the following to your Gemfile and bundle install

```
gem 'ionic_push', github: 'nwwatson/ionic_push', branch: 'master'
```

Run the Rails generator to install the initializer in to your Rails project.

```
bundle exec rails g ionic_push:install
```

Configure the ionic_push.rb file within config/initializers. You can view the environment variables that are there, or change them for someting else.

```Ruby
  IonicPush.setup do |config|
    # ==> Configuration for the Ionic.io Application ID
    # The Application ID can be found on the dashboard of
    # https://apps.ionic.io/apps
    config.ionic_application_id = ENV["IONIC_APPLICATION_ID"]

    # ==> Configuration for the Private API Key
    # The Private API Key for your application can be found
    # within the Settings of your application on
    # https://apps.ionic.io/apps
    config.ionic_api_key = ENV["IONIC_API_KEY"]

    # ==> Configuration for the location of the API
    # Refer to the Ionic documentation for the correct location
    # Current documentation can be found here:
    # http://docs.ionic.io/docs/push-sending-push and
    # defaults to https://push.ionic.io
    # config.ionic_api_url = ENV["IONIC_API_URL"]
  end
```

## Sending a Push Notification

```Ruby
# Create an array of device tokens you want to send to
device_tokens = [
  "APA91bEBoyoZ3EDXJbdjvzn2jdikRu7tdpz_65zkqfMDFTSNZfNgg-ohiNYQQ1TCTdjwqWZ",
  "WSt1XklxZeVj1WtxVBZXMIpIEt3YVaDs3f2Hp5QVmkwB0QgJ48d6KHVrHZCJxTER52yK3b0"
]

# Create a PushService instance for sending notifications
# The constructor can take a hash of parameters including:
#   device_tokens - An array of device tokens to push to
#   message - a hash the represents the message to send  
service = IonicPush::PushService.new(device_tokens: device_tokens)

# Call the notify! method to send the push notification
# The following sends sends a message that looks like this:
# {
#   "tokens":[
#    "APA91bEBoyoZ3EDXJbdjvzn2jdikRu7tdpz_65zkqfMDFTSNZfNgg-ohiNYQQ1TCTdjwqWZ",
#    "WSt1XklxZeVj1WtxVBZXMIpIEt3YVaDs3f2Hp5QVmkwB0QgJ48d6KHVrHZCJxTER52yK3b0"
#   ],
#   "notification":{
#     "alert":"Is this you John Wayne? Is this me?",
#   }
# }
service.alert!("Is this you John Wayne? Is this me?")

# You can also use the notify method and provide a message in a block
# The following sends sends a message that looks like this:
# {
#   "tokens":[
#    "APA91bEBoyoZ3EDXJbdjvzn2jdikRu7tdpz_65zkqfMDFTSNZfNgg-ohiNYQQ1TCTdjwqWZ",
#    "WSt1XklxZeVj1WtxVBZXMIpIEt3YVaDs3f2Hp5QVmkwB0QgJ48d6KHVrHZCJxTER52yK3b0"
#   ],
#   "notification":{
#     "alert":"You've got updated messages!",
#     "android":{
#       "title":"Updated Messages",
#       "payload":{
#         "type":"configuration"
#       }
#     }
#   }
# }
service.notify do
  {
    "alert":"You've got updated messages!",
    "android":{
      "title":"Updated Messages",
      "payload":{
        "type":"configuration"
      }
    }
  }
end
```

## License

This project rocks and uses MIT-LICENSE.
